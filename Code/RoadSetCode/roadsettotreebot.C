#include <iostream>
#include <string>

void roadsettotreebot(){
	string line;
	int roadid;
	int element[4];
	TFile *tfile = new TFile("currentroadsets.root","update" );
	TTree *t1 = new TTree("78_bot","librated tree");
	t1->Branch("roadid", &roadid,"roadid/I");
	float h1t[24];
	float h2t[17];
	float h3t[17];	
	float h4tu[17];	
	float h4td[17];	
for(int i=1; i<24 ; i++){
	char* tname[10];
	char* bname[10];
	sprintf(tname,"h1b%i",i);
	sprintf(bname,"h1b%i/F",i);
	TString arg1; 		TString arg2; 
	arg1.Form(tname);			arg2.Form(bname);	
	t1-> Branch(arg1,&h1t[i],arg2);
//	factory->AddVariable(arg2,'/F');
}
for(int i=1; i<17 ; i++){
	char* tname[10];
	char* bname[10];
	sprintf(tname,"h2b%i",i);
	sprintf(bname,"h2b%i/F",i);
	TString arg1; 		TString arg2; 
	arg1.Form(tname);			arg2.Form(bname);	
	t1-> Branch(arg1,&h2t[i],arg2);
//	factory->AddVariable(arg2,'/F');
}
for(int i=1; i<17 ; i++){
	char* tname[10];
	char* bname[10];
	sprintf(tname,"h3b%i",i);
	sprintf(bname,"h3b%i/F",i);
	TString arg1; 		TString arg2; 
	arg1.Form(tname);			arg2.Form(bname);	
	t1-> Branch(arg1,&h3t[i],arg2);
//	factory->AddVariable(arg2,'/F');
}
for(int i=1; i<17 ; i++){
	char* tname[10];
	char* bname[10];
	sprintf(tname,"h4bu%i",i);
	sprintf(bname,"h4bu%i/F",i);
	TString arg1; 		TString arg2; 
	arg1.Form(tname);			arg2.Form(bname);	
	t1-> Branch(arg1,&h4tu[i],arg2);
//	factory->AddVariable(arg2,'/F');
}
for(int i=1; i<17 ; i++){
	char* tname[10];
	char* bname[10];
	sprintf(tname,"h4bd%i",i);
	sprintf(bname,"h4bd%i/F",i);
	TString arg1; 		TString arg2; 
	arg1.Form(tname);			arg2.Form(bname);	
	t1-> Branch(arg1,&h4td[i],arg2);
//	factory->AddVariable(arg2,'/F');
}
int needed = 94208;
needed=needed/23;
int needed1=needed/16;
int needed2=needed1/16;
int needed3=needed2/16;
int needed4=needed3/16;
ifstream infile("78_bot.txt");//76(57)_bottom.txt
if(infile.is_open()){
	while( infile>>roadid ){
		infile>>element[0]>>element[1]>>element[2]>>element[3];
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
		h4tu[element[3]]=1;
		roadid=needed*element[0]-needed;
		roadid+=needed1*element[1]-needed1;
		roadid+=needed2*element[2]-needed2;
		roadid+=element[3]-needed3;
		t1->Fill();
	}
}

	t1->Write();
	infile.close();
}
