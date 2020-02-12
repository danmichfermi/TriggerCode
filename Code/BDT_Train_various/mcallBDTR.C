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
void mcallBDTR(){
TMVA::Tools::Instance();
   std::map<std::string,int> Use;
   Use["BDT"]             = 1; // uses Adaptive Boost

TString outfileName("TMVA.root");
   TFile* outputFile = TFile::Open( outfileName, "RECREATE" );
 TMVA::Factory *factory = new TMVA::Factory( "TMVAClassification", outputFile, "V:!Silent:Color:Transformations=I:DrawProgressBar:AnalysisType=Classification" ); //this can be changed

Double_t signalweight=1.0; //this can be changed
Double_t backgweight=1.0;
//TFile *datam= new TFile("realdatasplit.root","READ");
//TFile *data= new TFile("BDTtrain.root","READ");
TFile *data= new TFile("BDTNIM3M4_n3mc_low_binary.root","READ");
//TTree *signal = (TTree *) data->Get("signal");
//TFile *datam= new TFile("realdatasplit.root","READ");-
//TFile *datam= new TFile("traintoone.root","READ");
//TFile *datam = new TFile("withfilter.root","READ");
//TTree *signal = (TTree *) datam->Get("dynim3mat1");
TTree *signal = (TTree *) data->Get("signal");
//TTree *background = (TTree *) datams->Get("background");
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
for(int i=1; i<24 ; i++){
	char* tname[10];
	char* bname[10];
	sprintf(tname,"h1r%i",i);
	sprintf(bname,"h1b%i",i);
	TString arg1; 		TString arg2; 
	arg1.Form(tname);			arg2.Form(bname);	
	factory->AddVariable(arg1,'/F');
//	factory->AddVariable(arg2,'/F');
}
for(int i=1; i<17 ; i++){
	char* tname[10];
	char* bname[10];
//	if(i==17) continue;
	sprintf(tname,"h2r%i",i);
	sprintf(bname,"h2b%i",i);
	TString arg1; 		TString arg2; 
	arg1.Form(tname);			arg2.Form(bname);	
	 factory->AddVariable(arg1,'/F');
//	factory->AddVariable(arg2,'/F');
}
for(int i=20; i<20 ; i++){
	char* tname[10];
	char* bname[10];
	sprintf(tname,"h3r%i",i);
	sprintf(bname,"h3b%i",i);
	TString arg1; 		TString arg2; 
	arg1.Form(tname);			arg2.Form(bname);	
//	factory->AddVariable(arg1,'/F');
//	factory->AddVariable(arg2,'/F');
}
/*for(int i=1; i<17; i++){
		char* tname[10];
		char* tname2[10];
		char* bname[10];
		char* bname2[10];
		char* lname[10];
		char* lname2[10];
		char* rname[10];
		char* rname2[10];
		char* lname3[10];
		char* lname4[10];
		char* rname3[10];
		char* rname4[10];
		TString arg1; 		TString arg2; 		TString arg3; 		TString arg4; 
		TString arg5; 		TString arg6; 		TString arg7; 		TString arg8; 
		TString arg9; 		TString arg10; 		TString arg11;		TString arg12; 
		sprintf(tname,"h4tu%i",i);
		sprintf(tname2,"h4tu%i/I",i);
		sprintf(bname,"h4bu%i",i);
		sprintf(bname2,"h4bu%i/I",i);
		sprintf(rname,"h4Y1Rl%i",i);
		sprintf(rname2,"h4Y1Rl%i/I",i);
		sprintf(lname,"h4Y1Ll%i",i);
		sprintf(lname2,"h4Y1Ll%i/I",i);
		sprintf(lname3,"h4Y2Ll%i",i);
		sprintf(lname4,"h4Y2Ll%i/I",i);
		sprintf(rname3,"h4Y2Rl%i",i);
		sprintf(rname4,"h4Y2Rl%i/I",i);
		arg1.Form(tname);			arg2.Form(tname2);			arg3.Form(bname);			arg4.Form(bname2);
		arg5.Form(lname);			arg6.Form(lname2);			arg7.Form(rname);			arg8.Form(rname2);
		arg9.Form(lname3);			arg10.Form(lname4);			arg11.Form(rname3);			arg12.Form(rname4);
		factory->AddVariable(arg7,'/F');

		factory->AddVariable(arg11,'/F');	
/*		t1->Branch(arg1 ,&h4tu[i],arg2);
		t1->Branch(arg3 ,&h4bu[i],arg4);
		t1->Branch(arg5 ,&h4Y1Ll[i],arg6););
		sprintf(rname,"h4Y1Rr%i",i);
		t1->Branch(arg7 ,&h4Y1Rl[i],arg8);
		t1->Branch(arg9 ,&h4Y2Ll[i],arg10);
		t1->Branch(arg11 ,&h4Y2Rl[i],arg12);

}*/

	for(int i=1; i<16; i++){
		char* tname[10];
		char* tname2[10];
		char* bname[10];
		char* bname2[10];
		char* lname[10];
		char* lname2[10];
		char* rname[10];
		char* rname2[10];
		char* lname3[10];
		char* lname4[10];
		char* rname3[10];
		char* rname4[10];
		TString arg1; 		TString arg2; 		TString arg3; 		TString arg4; 
		TString arg5; 		TString arg6; 		TString arg7; 		TString arg8; 
		TString arg9; 		TString arg10; 		TString arg11;		TString arg12; 
		sprintf(tname,"h4td%i",i);
		sprintf(tname2,"h4td%i/I",i);
		sprintf(bname,"h4bd%i",i);
		sprintf(bname2,"h4bd%i/I",i);
		sprintf(lname,"h4Y1Rl%i",i);
		sprintf(lname2,"h4Y1Rl%i/I",i);
		sprintf(rname,"h4Y1Rr%i",i);
		sprintf(rname2,"h4Y1Rr%i/I",i);
		sprintf(lname3,"h4Y2Rl%i",i);
		sprintf(lname4,"h4Y2Rl%i/I",i);
		sprintf(rname3,"h4Y2Rr%i",i);
		sprintf(rname4,"h4Y2Rr%i/I",i);
		arg1.Form(tname);			arg2.Form(tname2);			arg3.Form(bname);			arg4.Form(bname2);
		arg5.Form(lname);			arg6.Form(lname2);			arg7.Form(rname);			arg8.Form(rname2);
		arg9.Form(lname3);			arg10.Form(lname4);			arg11.Form(rname3);			arg12.Form(rname4);
	/*	if((i!=3)&&(i!=16)) factory->AddVariable(arg5, '/F');
		if(i!=3) factory->AddVariable(arg7,'/F');
		if(i!=3) factory->AddVariable(arg9,'/F' );
		if(i!=3) factory->AddVariable(arg11,'/F');*/
		factory->AddVariable(arg5, '/F');
		factory->AddVariable(arg7,'/F');
		factory->AddVariable(arg9,'/F' );
		factory->AddVariable(arg11,'/F');	
}


	TCut mycuts="";
	TCut mycutb="";
	factory->PrepareTrainingAndTestTree(mycuts, mycutb, "random" );

	factory->BookMethod(TMVA::Types::kBDT,"BDT","NTrees=60:MaxDepth=17:SeparationType=CrossEntropy"); //this parameter can be changed
	//specific types boosting AdaBoost, RealAdaBoost, Bagging, AdaBoostR2, Grad- AdaBoostR2Loss: Liner Quadratic Exponential
	// UseBaggedBoost  sub sample, Use Nvars and randomized tree
	//nCuts :SeparationType=GiniIndexWithLaplace CrossEntropy
	//Prune Method :PruneMethod=CostComplexity
	//:NodePurityLimit=0.52
	factory->TrainAllMethods();
	factory->TestAllMethods();
	factory->EvaluateAllMethods();
outputFile->Close();

   if (!gROOT->IsBatch()) TMVAGui( outfileName );
}
//bihi 11_1024_cross may be incorrect
