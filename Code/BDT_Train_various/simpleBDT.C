#include <cstdlib>
#include <iostream>
#include <map>
#include <string>

#include "TChain.h"
#include "TFile.h"
#include "TTree.h"
#include "TString.h"
#include "TObjString.h"
#include "TSystem.h"
#include "TROOT.h"

#include "TMVAGui.C"


// needs to be included when makecint runs (ACLIC)
#include "TMVA/Factory.h"
#include "TMVA/Tools.h"

void simpleBDT(){
TMVA::Tools::Instance();
//   std::map<std::string,int> Use;
//   Use["BDT"]             = 1; // uses Adaptive Boost

TString outfileName("simplez.root");
   TFile* outputFile = TFile::Open( outfileName, "RECREATE" );
 TMVA::Factory *factory = new TMVA::Factory( "TMVAClassification", outputFile, "V:!Silent:Color:Transformations=I:DrawProgressBar:AnalysisType=Classification" ); //this can be changed

Double_t signalweight=1.0; //this can be changed
Double_t backgweight=1.0;
TFile *data= new TFile("simpsep.root","READ");
TTree *signal = (TTree *) data->Get("signal");
TTree *background = (TTree *) data->Get("background");

//TCut myuts=""  TMVA-v4.2.0/test

factory->AddSignalTree(signal, signalweight);
factory->AddBackgroundTree(background, backgweight);

/*	const int H1MAX=24;  // plus one to avoid shifting indi1ces later
	const int H2MAX=17;
	const int H3MAX=17;
	const int H4MAX=17;

	int h1t[H1MAX];
	int h2t[H2MAX];
	int h3t[H3MAX];
	int h4t[H4MAX];
	int h1b[H1MAX];
	int h2b[H2MAX];
	int h3b[H3MAX];
	int h4b[H4MAX];
	int q1, q2;*/

//how do I enter matrices? do I just not bother?
//	factory->AddVariable("q1",'I');

//cannot take in arrays of variable length per addvariable
//	factory->AddVariable("q2",'I');

	factory->AddVariable("h1t",'/I');
	factory->AddVariable("h2t",'/I');
	factory->AddVariable("h3t",'/I');
	factory->AddVariable("h4t",'/I');
	factory->AddVariable("h1b",'/I');
	factory->AddVariable("h2b",'/I');
	factory->AddVariable("h3b",'/I');
	factory->AddVariable("h4b",'/I');

	TCut mycuts="";
	TCut mycutb="";
	factory->PrepareTrainingAndTestTree(mycuts, mycutb, "random" );

	factory->BookMethod(TMVA::Types::kBDT,"BDT","NTrees=400:MaxDepth=7"); //this parameter can be changed
	factory->TrainAllMethods();
	factory->TestAllMethods();
	factory->EvaluateAllMethods();
outputFile->Close();

   if (!gROOT->IsBatch()) TMVAGui( outfileName );
}
