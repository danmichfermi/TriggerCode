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
#include "TAttFill.h"
// needs to be included when makecint runs (ACLIC)
#include "TMVA/Factory.h"
#include "TMVA/Tools.h"
#endif
void BDTLRtop(){
TMVA::Tools::Instance();
//   std::map<std::string,int> Use;
//   Use["BDT"]             = 1; // uses Adaptive Boost

TString outfileName("TMVA.root");

TFile* outputFile = TFile::Open( 
	                             outfileName, 
   	                           "RECREATE"
   	                           );
//Function creates a file and names it.
TMVA::Factory *factory = new TMVA::Factory(
                                          "TMVAClassification", 
                                          outputFile, 
                                          "V:Silent:Color:Transformations=I:"
                                          "DrawProgressBar:AnalysisType="
                                          "Classification" 
                                          ); //this can be changed
//This creates a pointer that has a job name, an outputfile, and a string 
//for options.
Double_t signalweight = 1.0; //this can be changed
Double_t backgweight = 1.0;
//TFile *datab= new TFile("n3_m2_bot.root","READ");
//TFile *data= new TFile("BDT_n3_mc_nim3mc_high_mass_binary_all_run5.root","READ");
//TFile *data= new TFile("nim3mcbinary_mat2o.root","READ");
TFile *datab= new TFile("run5rootm1/BDT_n3_mc_highxT_all_run5.root","READ");
TFile *data= new TFile("m2rootfiles/n3_m2_bot.root","READ");
//TFile *data= new TFile("BDTNIM3MC_mc_high_binary_2.root","READ");
//Tree *signal = (TTree *) data->Get("mc_nim3");
TTree *signal = (TTree *) data->Get("signal");
TTree *background = (TTree *) datab->Get("background");
//These pointers point to the signal and background data within the data file
//this data file actualy points to the BDTtrain file, so these functions
//basically become the signal and background information through some pointer
//abstraction.

factory->AddSignalTree(
	                    signal, 
	                    signalweight
	                    );
factory->AddBackgroundTree(
	                        background, 
	                        backgweight
	                        );
factory->SetSignalWeightExpression("sigma");
//TCut myuts=""  TMVA-v4.2.0/test

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
for(int i = 1; i < 11; i++)
{
	char* tname[10];
	char* bname[10];

	sprintf( tname, "h1r%i", i );
	sprintf(
		     bname, 
		     "h1l%i", 
		     i
		     );

	TString arg1, arg2; 
	arg1.Form(tname);			
	arg2.Form(bname);	
	factory->AddVariable(arg1,'/F' );
	factory->AddVariable(arg2,'/F');
}

for(int i = 1; i < 10; i++)
{
	char* tname[10];
	char* bname[10];

	sprintf(tname, "h2r%i",i);
	sprintf(bname, "h2l%i",i );

	TString arg1, arg2; 
	arg1.Form(tname);			
	arg2.Form(bname);	

	factory->AddVariable(arg1, '/F');
	factory->AddVariable(arg2,'/F');
}

/*for(int i=1; i<9; i++)
{
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
	arg1.Form(tname);  
	arg2.Form(tname2);			
	arg3.Form(bname);			
	arg4.Form(bname2);	
	arg5.Form(lname);			
	arg6.Form(lname2);			
	arg7.Form(rname);			
	arg8.Form(rname2);
	arg9.Form(lname3);			
	arg10.Form(lname4);			
	arg11.Form(rname3);			
	arg12.Form(rname4);
	factory->AddVariable(arg5,'/F');
	factory->AddVariable(arg7,'/F');
	factory->AddVariable(arg9,'/F');	
	factory->AddVariable(arg11,'/F');	
}*/

for(int i=1; i<9; i++)
{
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
/*	sprintf(lname,"h4Y1Lr%i",i);
	sprintf(lname2,"h4Y1Ll%i",i);
	sprintf(rname,"h4Y1Rr%i",i);
	sprintf(rname2,"h4YR1%i",i);
	sprintf(lname3,"h4Y2Lr%i",i);
	sprintf(lname4,"h4Y2Ll%i",i);
	sprintf(rname3,"h4Y2Rr%i",i);
	sprintf(rname4,"h4Y2Rl%i",i);*/
	sprintf(lname,"h4Y1L%i",i);
	sprintf(rname2,"h4Y1R%i",i);
	sprintf(lname3,"h4Y2L%i",i);
	sprintf(rname4,"h4Y2R%i",i);
	arg1.Form(tname);			
	arg2.Form(tname2);			
	arg3.Form(bname);			
	arg4.Form(bname2);
	arg5.Form(lname);			
	arg6.Form(lname2);			
	arg7.Form(rname);			
	arg8.Form(rname2);
	arg9.Form(lname3);			
	arg10.Form(lname4);			
	arg11.Form(rname3);			
	arg12.Form(rname4);
	factory->AddVariable(arg5,'/F');
	factory->AddVariable(arg8,'/F');
	factory->AddVariable(arg9,'/F');
	factory->AddVariable(arg12,'/F');
}

	TCut mycuts = "";
	TCut mycutb = "";
//	factor->AddSpectator("xT","/F");
	factory->PrepareTrainingAndTestTree(
		                                 mycuts, 
		                                 mycutb, 
		                                 "random"
		                                 );
	factory->BookMethod(TMVA::Types::kBDT,
		                 "BDT",
		                 "NTrees=96:MaxDepth=7:SeparationType=CrossEntropy:BoostType=AdaBoost:VarTransform=P"//SeparationType=CrossEntropy" GiniIndexWithLaplace
		
	                   ); //this parameter can be changed 

/*	factory->BookMethod(TMVA::Types::kRuleFit,
		                 "RuleFit",
		                 "nTrees=128:RFTMVA:MinImp=.001:RuleMinDist=0.0001"
	                   ); */
	factory->TrainAllMethods();
	factory->TestAllMethods();
	factory->EvaluateAllMethods();
  
  outputFile->Close();

  if (!gROOT->IsBatch())
  {
  	TMVAGui( outfileName );
  }
}
