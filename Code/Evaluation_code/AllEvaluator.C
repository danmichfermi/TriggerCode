#include <vector>
#include <istream>
#include <cstdlib>
#include <iostream>
#include <fstream>
#include <map>
#include <string>
#include <algorithm>
#include <sstream>
#include "TChain.h"
#include "TFile.h"
#include "TTree.h"
#include "TString.h"
#include "TObjString.h"
#include "TSystem.h"
#include "TROOT.h"
#include "TMVAGui.C"
#include "TMVA/Factory.h"
#include "TMVA/Tools.h"
#include "TH1F.h"
#endif

using std::vector;
using namespace std;


//Generalized Evaluation Code
//Change the file/treenames and weightfile name



void AllEvaluator(){

TMVA::Tools::Instance();
TMVA::Reader *reader = new TMVA::Reader( "V:Color:!Silent" );

TString filenamet=filename;
TString treenamet=treename;
weightfileName="";


TFile *data = new TFile(filenamet,"update");
TTree *datatree= (TTree *) data->Get(treenamet);
datatree->Write("",TObject::kOverwrite);

TString methodt=method;
methodt+=" method";
int bN = signalTree -> GetListOfBranches() -> GetEntries();
const int branchNum = (int)bN;
int eN = datatree -> GetEntries(); 
const int entryNum = (int)eN;
vector <float> entryVec, valVec;
TString branchName;
vector <TString> branchNameVec;
Float_t sigWeightTotal;
string line;
ifstream weightfile(weightfileName);
char* required = "Type=";
string restoffile="</Variables>";
if(weightfile){
	while(line.find("NVar")== std::string::npos){
	getline(weightfile,line);}
	while(getline(weightfile,line)){
		stringstream tempstream(line);
		string titleholder;
		getline(tempstream, titleholder, 'Expression');
		getline(tempstream, titleholder, '"');
		getline(tempstream, titleholder, '"');
		if(titleholder.find(restoffile) != std::string::npos) break;
		branchName = titleholder;
   		dataTree -> Branch(branchName, &entryVec[i], branchName + "/F");
    	branchNameVec.push_back(branchName);
	}
}
reader->BookMVA(methodt, weightname);
weightfile.close();
}
