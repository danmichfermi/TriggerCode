#include <iostream>
#include <string>

void roadsettotree(){
	string line;
	int charge;
	int roadid;
	int xbin;
	int element[5];
	TFile *tfile = new TFile("wspec.root","RECREATE");
	TTree *t1 = new TTree("77", "liberated tree");
//	TTree *t2= tfile->Get("77");
	t1->Branch("roadid", &roadid,"roadid/I");
	t1->Branch("xbin", &xbin,"xbin/I");
	int roadcheck;
//	t2->SetBranchAddress("roadid", &roadcheck);
	float h1t[24];
	float h2t[17];
	float h3t[17];	
	float h4tu[17];	
	float h4td[17];	
for(int i=1; i<24 ; i++){
	char* tname[10];
	char* bname[10];
	sprintf(tname,"h1t%i",i);
	sprintf(bname,"h1t%i/F",i);
	TString arg1; 		TString arg2; 
	arg1.Form(tname);			arg2.Form(bname);	
	t1-> Branch(arg1,&h1t[i],arg2);
//	factory->AddVariable(arg2,'/F');
}
for(int i=1; i<17 ; i++){
	char* tname[10];
	char* bname[10];
	sprintf(tname,"h2t%i",i);
	sprintf(bname,"h2t%i/F",i);
	TString arg1; 		TString arg2; 
	arg1.Form(tname);			arg2.Form(bname);	
	t1-> Branch(arg1,&h2t[i],arg2);
//	factory->AddVariable(arg2,'/F');
}
for(int i=1; i<17 ; i++){
	char* tname[10];
	char* bname[10];
	sprintf(tname,"h3t%i",i);
	sprintf(bname,"h3t%i/F",i);
	TString arg1; 		TString arg2; 
	arg1.Form(tname);			arg2.Form(bname);	
	t1-> Branch(arg1,&h3t[i],arg2);
//	factory->AddVariable(arg2,'/F');
}
for(int i=1; i<17 ; i++){
	char* tname[10];
	char* bname[10];
	sprintf(tname,"h4tu%i",i);
	sprintf(bname,"h4tu%i/F",i);
	TString arg1; 		TString arg2; 
	arg1.Form(tname);			arg2.Form(bname);	
	t1-> Branch(arg1,&h4tu[i],arg2);
//	factory->AddVariable(arg2,'/F');
}
int id=0;
for(int i=1; i<17 ; i++){
	char* tname[10];
	char* bname[10];
	sprintf(tname,"h4td%i",i);
	sprintf(bname,"h4td%i/F",i);
	TString arg1; 		TString arg2; 
	arg1.Form(tname);			arg2.Form(bname);	
	t1-> Branch(arg1,&h4td[i],arg2);
//	factory->AddVariable(arg2,'/F');
}
	ifstream infile ("77.dat");
	if(infile.is_open()){
		while( infile>>roadid ){
			infile>>element[0]>>element[1]>>element[2]>>element[3]>>charge>>element[4];
//			getline(infile, line ,"\n");
			getline(infile, line);
			for(int i=1;i<24 ; i++){
				for(int j=1; j<17; j++){
					for(int k=1; k<17; k++){
						for(int l=1; l<17; l++){
							for(int m=1; m<17; m++){
								 h1t[i]=0;
								 h2t[j]=0;
								h3t[k]=0;
								h4tu[l]=0;
								h4td[m]=0;
						
							}
						}
					}
				}
			}
			h1t[element[0]]=1;
			h2t[element[1]]=1;
			h3t[element[2]]=1;
			h4tu[element[3]]=1;
			h4td[element[3]]=1;
			xbin=element[4];
			t1->Fill();
			for(int z=0; z<4; z++){
	//			cout<<element[z]<<"\t";
			}
	//		cout<<endl;
/*			for(int k=0; k< t2->GetEntries(); k++){
				t2->GetEntry(k);
			}*/
		}
	}
	infile.close();
	t1->Write();
}
