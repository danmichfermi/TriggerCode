//Program used to analyze all hodoscope hits at once 
//Added Additional Comments
//olderexperimental version




// needs to be included when makecint runs (ACLIC)
#include "TMVA/Factory.h"
#include "TMVA/Tools.h"
#include "mvas.C"
#include "TMVAGui.C"
#include "mvaeffs.C"
#include "efficiencies.C"
#endif
void BDTalltemp(){
//TMVA Initiazation
TMVA::Tools::Instance();
TString outfileName("TMVA.root");
TFile* outputFile = TFile::Open( outfileName, "RECREATE" );
TMVA::Factory *factory = new TMVA::Factory( "TMVAClassification", outputFile, "V:!Silent:Color:DrawProgressBar:AnalysisType=Classification:Transformations=I" ); //this can be changed but this is the simplest form
Double_t signalweight=1.0; //this can be changed, but generally keep at one
Double_t backgweight=1.0;


////EDIT HERE////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//Data File Used
TFile *data= new TFile("n3_mc_n3mc_m1_short.root","READ");
//TFile *data= new TFile("BDTtrain.root","READ");
//BDT_n3_m4_mc_highmass_all_run5.root
//BDT_n3m4_mc_highmass_run5.root
//
TTree *signal = (TTree *) data->Get("signal");
TTree *background = (TTree *) data->Get("background");

factory->AddSignalTree(signal, signalweight);
factory->AddBackgroundTree(background, backgweight);

bool useBDT=true;
//Boosted Decision Tree
//TString AnalyzationType="BDT"; 
TString AnalyzationType="SVM";
TString AnalyzerParameters="Gamma=1:C=1:Tol=0.01:MaxIter=1000:VarTransform=P";
//Gamma=1:C=1:Tol=0.01:MaxIter=1000
bool useTMLP=false;
//Neural Net: MLP  (same as earliest)
//TString AnalyzationType="TMlp_ANN";
//TString AnalyzerParameters="HiddenLayers=15,10";
//Learning Methods Batch, SteepestDescent, RibierePolak, FletcherReeves,BFGS

bool useMLPANN=false;
//TString AnalyzationType="MLP_ANN";
//TString AnalyzerParameters="NCycles=400:HiddenLayers=X,Y:LearningMethod=BFGS:EstimatorType=CE";
//Learning Methods= BP,GA. BFGS
//EstimatorType MSE, CE, linear, sigmoid, tanh, radial
//NeuronInputType=sum,sqsum, or abssum
//LearningRate=.02, DecayRate=.01
//Tau=3  Line Search size step

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*for(int i=1; i<24 ; i++){
	char* tname[10];
	char* bname[10];
	char* lname[10];
	char* rname[10];
	TString arg1; 		TString arg2; 	TString arg3; 		TString arg4; 
	sprintf(tname,"h1t%i",i);
	sprintf(bname,"h1b%i",i);
	sprintf( lname, "h1r%i", i );
	sprintf( rname, "h1l%i",i);
	arg1.Form(tname);			
	arg2.Form(bname);	
	arg3.Form(lname);
	arg4.Form(rname);	
	factory->AddVariable(arg1,'F');
	factory->AddVariable(arg2,'F');
	if (i<21) factory->AddVariable(arg3,'/F' );
	if (i<21) factory->AddVariable(arg4,'/F');
}*/
for(int i=1; i<20 ; i++){
	char* tname[10];
	char* bname[10];
	char* lname[10];
	char* rname[10];
	TString arg1; 		TString arg2; 	TString arg3; 		TString arg4; 
	sprintf(tname,"h2t%i",i);
	sprintf(bname,"h2b%i",i);
	sprintf( lname, "h2r%i", i );
	sprintf( rname, "h2l%i",i);
	arg1.Form(tname);			
	arg2.Form(bname);	
	arg3.Form(lname);
	arg4.Form(rname);	
	if (i<17) factory->AddVariable(arg1,'F');
	if (i<17) factory->AddVariable(arg2,'F');
	factory->AddVariable(arg3,'/F' );
	factory->AddVariable(arg4,'/F');
}
for(int i=1; i<10 ; i++){
	char* tnamez[10];
	char* bname[10];
	sprintf(tnamez,"h3t%i",i);
	sprintf(bname,"h3b%i",i);
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
	sprintf(tname,"h4tu%i",i);
	sprintf(tname2,"h4tu%i/I",i);
	sprintf(bname,"h4bu%i",i);
	sprintf(bname2,"h4bu%i/I",i);
	sprintf(tname3,"h4tu%i",i);

	sprintf(bname3,"h4bu%i",i);
/*	sprintf(lname,"h4Y1Lr%i",i);
	sprintf(lname2,"h4Y1Ll%i",i);
	sprintf(rname,"h4Y1Rr%i",i);
	sprintf(rname2,"h4Y1Rl%i",i);
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
	factory->AddVariable(arg1,'/F');
	factory->AddVariable(arg3,'/F');
	factory->AddVariable(arg5,'/F');
//	factory->AddVariable(arg6,'/F');
//	factory->AddVariable(arg7,'/F');
	factory->AddVariable(arg8,'/F');
	factory->AddVariable(arg9,'/F');
//	factory->AddVariable(arg10,'/F');
//	factory->AddVariable(arg11,'/F');
	factory->AddVariable(arg12,'/F');
}

TCut mycuts="";
TCut mycutb="";
factory->PrepareTrainingAndTestTree(mycuts, mycutb, "random" );

if(useBDT)	factory->BookMethod(TMVA::Types::kSVM,AnalyzationType,AnalyzerParameters); //this parameter can be changed
if(useTMLP)	factory->BookMethod(TMVA::Types::kTMlpANN,AnalyzationType,AnalyzerParameters); //this parameter can be changed
if(useMLPANN)	factory->BookMethod(TMVA::Types::kMLP,AnalyzationType,AnalyzerParameters); //this parameter can be changed
factory->TrainAllMethods();
factory->TestAllMethods();
factory->EvaluateAllMethods();
outputFile->Close();
//TMVAGui( outfileName );
mvas("TMVA.root", 3);
mvaeffs("TMVA.root");
efficiencies("TMVA.root");
cout<<"finished"<<endl;
}
