//Program used to analyze all hodoscope hits at once 
//Added Additional Comments
//has more than one operating mode


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
#include "mvas.C"
#include "TMVAGui.C"
#include "mvaeffs.C+"
#include "efficiencies.C"


// needs to be included when makecint runs (ACLIC)
#include "TMVA/Factory.h"
#include "TMVA/Tools.h"
#endif
void BDTallhodo(){
//TMVA Initiazation
TMVA::Tools::Instance();
TString outfileName("TMVA3.root");
TFile* outputFile = TFile::Open( outfileName, "RECREATE" );
TMVA::Factory *factory = new TMVA::Factory( "TMVAClassification", outputFile, "V:Silent:Color:Transformations=I:DrawProgressBar:AnalysisType=Classification" ); //this can be changed but this is the simplest form
Double_t signalweight=1.0; //this can be changed, but generally keep at one
Double_t backgweight=1.0;


////EDIT HERE////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//Data File Used
TFile *data= new TFile("rootfiles/n3_mc_charge.root","READ");
TFile *datab= new TFile("rootfiles/birealdata_matrix2_com.root","READ");
//TFile *datab= new TFile("./run5rootm1/nim3mcbinary_run5.root","READ");
//BDT_n3_m4_mc_highmass_all_run5.root
//BDT_n3m4_mc_highmass_run5.root
//
TTree *signal = (TTree *) data->Get("signal");
TTree *background = (TTree *) data->Get("background");

factory->AddSignalTree(signal, signalweight);
factory->AddBackgroundTree(background, backgweight);
factory -> SetSignalWeightExpression("matrix1true");
factory -> SetSignalWeightExpression("weight");
//factory -> SetBackgroundWeightExpression();

bool useBDT=true;
//Boosted Decision Tree 
TString AnalyzationType="BDT";
TString AnalyzerParameters="NTrees=256:MaxDepth=7:SeparationType=CrossEntropy";//VarTransform=P

bool useTMLP=false;
//Neural Net: MLP  (same as earliest)
//TString AnalyzationType="TMlp_ANN";
//TString AnalyzerParameters="NCycles=400:HiddenLayers=X,Y:LearningMethod=Stochastic";
//Learning Methods Batch, SteepestDescent, RibierePolak, FletcherReeves,BFGS

bool useMLPANN=false;
//TString AnalyzationType="MLPANN";
//TString AnalyzerParameters="NCycles=400:HiddenLayers=X,Y:LearningMethod=BFGS:EstimatorType=CE";
//Learning Methods= BP,GA. BFGS
//EstimatorType MSE, CE, linear, sigmoid, tanh, radial
//NeuronInputType=sum,sqsum, or abssum
//LearningRate=.02, DecayRate=.01
//Tau=3  Line Search size step

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

int functionholds;

for(int i=1; i<24 ; i++){
	char* tname[10];
	char* bname[10];
	char* lname[10];
	char* rname[10];
	TString arg1; 		TString arg2; 	TString arg3; 		TString arg4; 
	functionholds=sprintf(tname,"h1t%i",i);
	functionholds=sprintf(bname,"h1b%i",i);
	functionholds=sprintf( lname, "h1r%i", i );
	functionholds=sprintf( rname, "h1l%i",i);
	arg1.Form(tname);			
	arg2.Form(bname);	
	arg3.Form(lname);
	arg4.Form(rname);	
	factory->AddVariable(arg1,'F');
	factory->AddVariable(arg2,'F');
	if (i<21) factory->AddVariable(arg3,'/F' );
	if (i<21) factory->AddVariable(arg4,'/F');
}
for(int i=1; i<20 ; i++){
	char* tname[10];
	char* bname[10];
	char* lname[10];
	char* rname[10];
	TString arg1; 		TString arg2; 	TString arg3; 		TString arg4; 
	functionholds=sprintf(tname,"h2t%i",i);
	functionholds=sprintf(bname,"h2b%i",i);
	functionholds=sprintf( lname, "h2r%i", i );
	functionholds=sprintf( rname, "h2l%i",i);
	arg1.Form(tname);			
	arg2.Form(bname);	
	arg3.Form(lname);
	arg4.Form(rname);	
	if (i<17) factory->AddVariable(arg1,'F');
	if (i<17) factory->AddVariable(arg2,'F');
	//factory->AddVariable(arg3,'/F' );
	//factory->AddVariable(arg4,'/F');
}
for(int i=1; i<17 ; i++){
	char* tnamez[10];
	char* bname[10];
	functionholds=sprintf(tnamez,"h3t%i",i);
	functionholds=sprintf(bname,"h3b%i",i);
	TString argz; 		TString arg2; 
	argz.Form(tnamez);			arg2.Form(bname);	
	factory->AddVariable(argz,'F');
	factory->AddVariable(arg2,'F');
}

for(int i=1; i<17 ; i++){
	char* tname[10];
	char* tname2[10];
	char* tname3[10];
	char* bname[10];
	char* bname2[10];
	char* bname3[10];
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
	functionholds=sprintf(tname,"h4tu%i",i);
	functionholds=sprintf(tname2,"h4tu%i/I",i);
	functionholds=sprintf(bname,"h4bu%i",i);
	functionholds=sprintf(bname2,"h4bu%i/I",i);
	functionholds=sprintf(tname3,"h4tu%i",i);

	functionholds=sprintf(bname3,"h4bu%i",i);
/*	functionholds=sprintf(lname,"h4Y1Lr%i",i);
	functionholds=sprintf(lname2,"h4Y1Ll%i",i);
	functionholds=sprintf(rname,"h4Y1Rr%i",i);
	functionholds=sprintf(rname2,"h4Y1Rl%i",i);
	functionholds=sprintf(lname3,"h4Y2Lr%i",i);
	functionholds=sprintf(lname4,"h4Y2Ll%i",i);
	functionholds=sprintf(rname3,"h4Y2Rr%i",i);
	functionholds=sprintf(rname4,"h4Y2Rl%i",i);*/
	functionholds=sprintf(lname,"h4Y1L%i",i);
	functionholds=sprintf(rname2,"h4Y1R%i",i);
	functionholds=sprintf(lname3,"h4Y2L%i",i);
	functionholds=sprintf(rname4,"h4Y2R%i",i);
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
	factory->AddVariable(arg1,'/F');
	factory->AddVariable(arg3,'/F');
//	factory->AddVariable(arg5,'/F');
//	factory->AddVariable(arg6,'/F');
//	factory->AddVariable(arg7,'/F');
//	factory->AddVariable(arg8,'/F');
//	factory->AddVariable(arg9,'/F');
//	factory->AddVariable(arg10,'/F');
//	factory->AddVariable(arg11,'/F');
//	factory->AddVariable(arg12,'/F');
}

TCut mycuts="mass>4.0";
TCut mycutb="";
factory->PrepareTrainingAndTestTree(mycuts, mycutb, "random" );
//std::string tmvatype="TMVA::Types::kBDT";
if(useBDT)	factory->BookMethod(TMVA::Types::kBDT,AnalyzationType,AnalyzerParameters); //this parameter can be changed
if(useTMLP)	factory->BookMethod(TMVA::Types::kTMlpANN,AnalyzationType,AnalyzerParameters); //this parameter can be changed
if(useMLPANN)	factory->BookMethod(TMVA::Types::kMLP,AnalyzationType,AnalyzerParameters); //this parameter can be changed
factory->TrainAllMethods();
factory->TestAllMethods();
factory->EvaluateAllMethods();
outputFile->Close();
//if (gROOT->IsBatch()) TMVAGui( outfileName );
mvas(outfileName, 3);
mvaeffs(outfileName);
efficiencies(outfileName);
gSystem->CopyFile("./weights/TMVAClassification_BDT.weights.xml", "./bothhalves/topbotreal.xml");
gSystem->CopyFile("./plots/rejBvsS.png", "./bothhalves/weightedrealtopbotROC256.png");
gSystem->CopyFile("./plots/overtrain_BDT.png", "./bothhalves/weightedrealtopbotresp256.png");
gSystem->CopyFile("./plots/mvaeffs_BDT.png", "./bothhalves/weightedrealtopboteffs256.png");
cout<<"finished"<<endl;
}
