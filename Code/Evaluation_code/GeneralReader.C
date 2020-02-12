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
#include "TBranch.h"
#endif

using std::vector;
using namespace std;

int GeneralReader(){

bool generatehistogram=true;
bool filltree=true;
TString branchname="test1";
TString branchnameF=branchname;
branchnameF+="/F";

TMVA::Tools::Instance();
TMVA::Reader *reader = new TMVA::Reader( "V:Color:!Silent" );
TString filename="./m2rootfiles/n3_m2_top.root";
//TString filename="n3_mc_n3mc_m1.root";
//n3mc_m2_top.root
TString treename="background";
TString filenamet=filename;
TString treenamet=treename;
TString method="BDT method";
string weightname="./weights/LRtop_m2_n3mc_sigma_true.xml";
TString weightnamet=weightname;
TString branchname=weightname+"responses";
TFile *data = new TFile(filenamet,"update");
/*if(data->IsZombie()){
	"Warning: Zombie file inputed. Check if Empty or Corrupted"
	return 1;
}*/
TTree *datatree= (TTree *) data->Get(treenamet);
float BDT_response;


if(filltree) TBranch *derps =  datatree->Branch(branchname, &BDT_response, branchnameF);
//if(generatehistogram) TH1F *h1 = new TH1F("h1",branchname,200,-1,1);
if(generatehistogram) cout<<"Sorry Currently Feature Mem Leaking"<<endl;

int eN = datatree -> GetEntries(); 
const int entryNum = (int)eN;
vector <float> entryVec, valVec;
vector <Int_t> ivarhold;
vector <int> indexmatcher;
TString branchName;
vector <TString> branchNameVec;
Float_t sigWeightTotal;
string line;
ifstream weightfile(weightname.data());
char* required = "Type=";
string varend="</Variables>";
string spectatorstart="/Spectators";
string spectatorend="\"0\"";
int i=0;
int j=0;
cout<<"fuck"<<endl;
int branchNum = datatree -> GetListOfBranches() -> GetEntries();
const int brancharraynum = branchNum;
int ivarholdarray[brancharraynum];

if(weightfile){
	while(line.find("NVar")== std::string::npos){
	getline(weightfile,line);}
	while(getline(weightfile,line)){
		stringstream tempstream(line);
		string titleholder;
		getline(tempstream, titleholder, 'Expression');
		getline(tempstream, titleholder, '"');
		getline(tempstream, titleholder, '"');
		if(titleholder.find(varend) != std::string::npos) break;
		branchName = titleholder;
  		TString type = datatree -> GetLeaf(branchName) -> GetTypeName();
		entryVec.push_back(0);
		if (type.Contains("i") || type.Contains("I")) {;
			ivarhold.push_back(0);
			indexmatcher.push_back(entryVec.size());
			datatree -> SetBranchAddress(branchName, &ivarholdarray[i]);
			cout<<ivarhold[ivarhold.size()-1]<<endl;
		}
		else datatree -> SetBranchAddress(branchName, &entryVec[i]);
		reader->AddVariable(branchName, &entryVec[i]);
    	branchNameVec.push_back(branchName);
		i++;
	}
	if(titleholder.find(spectatorstart) != std::string::npos) break;
	if(titleholder.find(spectatorend) == std::string::npos){
		cout<<"fail"<<endl;
		getline(weightfile,line);
		while(getline(weightfile,line)){
			stringstream tempstream(line);
			string titleholder;
			getline(tempstream, titleholder, 'Expression');
			getline(tempstream, titleholder, '"');
			getline(tempstream, titleholder, '"');
			if(titleholder.find(spectatorstart) != std::string::npos) break;
			branchName = titleholder;
//			datatree -> SetBranchAddress(branchName, &entryVec[i]);
//			reader->AddSpectator(branchName, &entryVec[i]);
	    	branchNameVec.push_back(branchName);
			j++;
			i++;
		}
	}
}

weightfile.close();
cout<<entryVec.size()<<endl;
reader->BookMVA(method, weightnamet);
for (int ievt=0; ievt<(datatree->GetEntries());ievt++) {
	datatree->GetEntry(ievt);
	for(int z=0; z<ivarhold.size(); z++){
		entryVec[indexmatcher[z]]=ivarholdarray[z];
		if (ievt%1000 == 0) cout<<ivarholdarray[z];
	}
	if (ievt%1000 == 0) std::cout << "--- ... Processing event: " << ievt <<std::endl;
	BDT_response=reader->EvaluateMVA("BDT method");
	if (ievt%1000 == 0) cout<<BDT_response<<endl;
//	if(generatehistogram) h1->Fill(BDT_response);
	if(filltree) derps->Fill();
//	h1->Fill(ievt);
}

//if(generatehistogram) h1->Draw();
datatree->Write("",TObject::kOverwrite);
return 0;
data->Close();
}
