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
#endif
void advBDT(){
TMVA::Tools::Instance();
//   std::map<std::string,int> Use;
//   Use["BDT"]             = 1; // uses Adaptive Boost

TString outfileName("TMVA.root");
   TFile* outputFile = TFile::Open( outfileName, "RECREATE" );
 TMVA::Factory *factory = new TMVA::Factory( "TMVAClassification", outputFile, "V:!Silent:Color:Transformations=I:DrawProgressBar:AnalysisType=Classification" ); //this can be changed

Double_t signalweight=1.0; //this can be changed
Double_t backgweight=1.0;
TFile *data= new TFile("n3_mc_n3mc_m1.root","READ");
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

	//removing h1t1?
for(int i=5; i<19 ; i++){
	char* tname[10];
	char* bname[10];
	sprintf(tname,"h1t%i",i);
	sprintf(bname,"h1b%i",i);
	TString arg1; 		TString arg2; 
	arg1.Form(tname);			arg2.Form(bname);	
	factory->AddVariable(arg1,'F');
	factory->AddVariable(arg2,'F');
}
for(int i=1; i<17 ; i++){
	char* tnamez[10];
	char* bname[10];
	sprintf(tnamez,"h2t%i",i);
	sprintf(bname,"h2b%i",i);
	TString argz; 		TString arg2; 
	argz.Form(tnamez);			arg2.Form(bname);	
 	factory->AddVariable(argz,'F');
	factory->AddVariable(arg2,'F');
}
for(int i=1; i<17 ; i++){
	char* tnamez[10];
	char* bname[10];
	sprintf(tnamez,"h3t%i",i);
	sprintf(bname,"h3b%i",i);
	TString argz; 		TString arg2; 
	argz.Form(tnamez);			arg2.Form(bname);	
	factory->AddVariable(argz,'F');
	factory->AddVariable(arg2,'F');
}
for(int i=1; i<16 ; i++){
	char* tnamez[10];
	char* bname[10];
	sprintf(tnamez,"h4tu%i",i);
	sprintf(bname,"h4bu%i",i);
	TString argz; 		TString arg2; 
	argz.Form(tnamez);			arg2.Form(bname);	
	factory->AddVariable(argz,'F');
	factory->AddVariable(arg2,'F');
}
/*for(int i=1; i<16 ; i++){
	char* tnamez[10];
	char* bname[10];
	sprintf(tnamez,"h4td%i",i);
	sprintf(bname,"h4bd%i",i);
	TString argz; 		TString arg2; 
	argz.Form(tnamez);			arg2.Form(bname);	
	factory->AddVariable(argz,'F');
	factory->AddVariable(arg2,'F');
}*/

//	factory->AddVariable("q2",'I');


	TCut mycuts="";
	TCut mycutb="";
	factory->PrepareTrainingAndTestTree(mycuts, mycutb, "random" );

	factory->BookMethod(TMVA::Types::kBDT,"BDT","NTrees=256:MaxDepth=8"); //this parameter can be changed
	factory->TrainAllMethods();
	factory->TestAllMethods();
	factory->EvaluateAllMethods();
outputFile->Close();

   if (!gROOT->IsBatch()) TMVAGui( outfileName );
}
