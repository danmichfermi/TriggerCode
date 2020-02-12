void roadcomparemiss(){
TFile *data= new TFile("BDTMATRIX1v3.root","READ");
//TTree *//signal = (TTree *) data->Get("//signal");
//TTree *//background = (TTree *) data->Get("//background");
//TFile* myroads = new TFile("level1roads.root","update"); 
//TTree* roadcurrenttree = (TTree*)(myroads->Get("secondcut_3"));
TFile* myroads = new TFile("currentroadsets.root","update"); 
TTree* roadcurrenttree = (TTree*)(myroads->Get("78_bot"));
//TFile* road57 = new TFile("currentroadsets.root","READ"); 
//TTree *roadcurrenttree = (TTree*)(road57->Get("77;2"));
int pass;
int normroadid;
int myroadid;
//roadcurrenttree->SetBranchAddress("roadid",&normroadid);
roadcurrenttree->SetBranchAddress("roadid",&myroadid);
TBranch *derp=roadcurrenttree->Branch("CurrentRoad",&pass,"CurrentRoad/I");
int stotal=0;
int temporaryconst=roadcurrenttree->GetEntries();
const int number=temporaryconst;
int roads[number];
const int H1MAX=24;  // plus one to avoid shifting indi1ces later
const int H2MAX=17;
const int H3MAX=17;
const int H4MAX=17;
float h1t[H1MAX];
float  h2t[H2MAX];
float h3t[H3MAX];
float h4tu[H4MAX];
float h4td[H4MAX];
float ch1t[H1MAX];
float ch2t[H2MAX];
float ch3t[H3MAX];
float ch4tu[H4MAX];
float ch4td[H4MAX];
float matpurity;
float BDT_response;
float BDT_response_2;
float nimpurity;
int totalroad;
float mass;

roadcurrenttree->SetBranchAddress("nimpurity2",&nimpurity);
roadcurrenttree->SetBranchAddress("mat4purity2",&matpurity); 
//roadcurrenttree->SetBranchAddress("BDT_NIM3cross_dy", &BDT_response_2);
//roadcurrenttree->SetBranchAddress("DrellYan_n3", &BDT_response_2);
//roadcurrenttree->SetBranchAddress("BDT_mat4_dy", &BDT_response);
roadcurrenttree->SetBranchAddress("mass2", &mass);
roadcurrenttree->SetBranchAddress("num2", &totalroad);

for(int i=0; i<number ; i++){
	roads[i]=0;
}
for(int i=1; i<24 ; i++){
		char* tname[10];
		char* tname2[10];
		char* bname[10];
		char* bname2[10];
		TString arg1; 		TString arg3; 		TString arg3; 		TString arg4; 
		sprintf(tname,"h1t%i",i);
		sprintf(tname2,"h1t%i",i);
		sprintf(bname,"h1b%i",i);
		sprintf(bname2,"h1b%i/F",i);
//		arg1.Form(tname);			arg3.Form(tname2);
		arg3.Form(bname);			arg4.Form(bname2);
		//signal->SetBranchAddress(arg3, &h1t[i]);
		//background->SetBranchAddress(arg3, &h1t[i]);
		roadcurrenttree->SetBranchAddress(arg3, &ch1t[i]);
		roadcurrenttree->SetBranchAddress(arg3, &h1t[i]);
}
for(int i=1; i<17 ; i++){
		char* tname[10];
		char* tname2[10];
		char* bname[10];
		char* bname2[10];
		TString arg1; 		TString arg3; 		TString arg3; 		TString arg4; 
		sprintf(tname,"h2t%i",i);
		sprintf(tname2,"h2t%i",i);
		sprintf(bname,"h2b%i",i);
		sprintf(bname2,"h2b%i/F",i);
	//	arg1.Form(tname);			arg3.Form(tname2);		
		arg3.Form(bname);			arg4.Form(bname2);
		//signal->SetBranchAddress(arg3, &h2t[i]);
		//background->SetBranchAddress(arg3, &h2t[i]);
		roadcurrenttree->SetBranchAddress(arg3, &ch2t[i]);
		roadcurrenttree->SetBranchAddress(arg3, &h2t[i]);
}
for(int i=1; i<17 ; i++){
		char* tname[10];
		char* tname2[10];
		char* bname[10];
		char* bname2[10];
		TString arg1; 		TString arg3; 		TString arg3; 		TString arg4; 
		sprintf(tname,"h3t%i",i);
		sprintf(tname2,"h3t%i",i);
		sprintf(bname,"h3b%i",i);
		sprintf(bname2,"h3b%i/F",i);
		//arg1.Form(tname);		arg3.Form(tname2);
		arg3.Form(bname);			arg4.Form(bname2);
		roadcurrenttree->SetBranchAddress(arg3, &ch3t[i]);
		roadcurrenttree->SetBranchAddress(arg3, &h3t[i]);
}
for(int i=1; i<17 ; i++){
		char* tname[10];
		char* tname2[10];
		char* bname[10];
		char* bname2[10];
		TString arg1; 		TString arg3; 		TString arg3; 		TString arg4; 
		sprintf(tname,"h4tu%i",i);
		sprintf(tname2,"h4tu%i",i);
		sprintf(bname,"h4bu%i",i);
		sprintf(bname2,"h4bu%i/F",i);
//		arg1.Form(tname);			arg3.Form(tname2);//	
		arg3.Form(bname);			arg4.Form(bname2);
		//signal->SetBranchAddress(arg3, &h4tu[i]);
		//background->SetBranchAddress(arg3, &h4tu[i]);
		roadcurrenttree->SetBranchAddress(arg3, &ch4tu[i]);
		roadcurrenttree->SetBranchAddress(arg3, &h4tu[i]);
}
/*for(int i=1; i<17 ; i++){
		char* tname[10];
		char* tname2[10];
		char* bname[10];
		char* bname2[10];
		TString arg1; 		TString arg3; 		TString arg3; 		TString arg4; 
		sprintf(tname,"h4td%i",i);
		sprintf(tname2,"h4td%i",i);
		sprintf(bname,"h4bd%i",i);
		sprintf(bname2,"h4bd%i/F",i);
		arg1.Form(tname);			arg3.Form(tname2);//			arg3.Form(bname);			arg4.Form(bname2);
		//signal->SetBranchAddress(arg3, &h4td[i]);
		//background->SetBranchAddress(arg3, &h4td[i]);
		roadcurrenttree->SetBranchAddress(arg3, &ch4td[i]);
		roadcurrenttree->SetBranchAddress(arg3, &h4td[i]);
}*/
ofstream outfile2 ("myroazds.txt");
ofstream outfile ("roadsmissing.txt");

for(int i=0; i< roadcurrenttree->GetEntries() ; i++){
	pass=0;
	bool triggered=false;
	roadcurrenttree->GetEntry(i);
	vector<int> first;
	vector<int> second;
	vector<int> third;
	vector<int> fourth;
	vector<int> fifth; 
//	for(int x=0; x<(roadcurrenttree->GetEntries()); x++){
//		roadcurrenttree->GetEntry(x);
		bool correct=false;
		bool looping=true;
		int check[4]={0,0,0,0};

		for(int j=1; j<17 ; j++){
			if(h4tu[j]>0){
				fourth.push_back(j);
			}
		}	
		if(!(correct)){
			looping=false;
		}
		correct=false;
		for(int j=1; j<17 ; j++){
			if(h3t[j]>0){
				third.push_back(j);
			}
		}	
		if(!(correct)){
			looping=false;
		}
		correct=false;
		for(int j=1; j<17 ; j++){
			if(h2t[j]>0){
				second.push_back(j);
			}
		}	
		if(!(correct)){
			looping=false;
		}
		correct=false;
		for(int j=1; j< 24; j++){
			if(h1t[j]>0){
				first.push_back(j); }
		}
		int product=1;
		for(int y=0; y<4 ; y++){
			product= product*check[y];
		} 
		if((!triggered)&&(product>0)){
			pass=1;
			triggered=true;
			stotal++;			
		}

//	}
	bool fillerup =true;
/*	if(	(	(second[0]<(third[0])	)
	&&(fourth[0]<(third[0]-1)	)	)	||	f			//no zig zagging station 1-3
	(	(second[0]>(third[0]-1))&&
		(fourth[0]>(third[0]+1))	)	)  fillerup=false;
	if(	(	(first[0]<(second[0])	)
	&&(third[0]<(second[0]-1)	)	)	||				//no zig zagging station 1-3
	(	(first[0]>(second[0]-1))&&
		(third[0]>(second[0]+1))	)	)  fillerup=false;*/
	roadcurrenttree->GetEntry(i);
	if((nimpurity<.5)&&fillerup){ outfile<<myroadid;
	outfile<<"\t"<<first[0]<<"\t"<<second[0]<<"\t"; outfile<<third[0]<<"\t"<<fourth[0];
outfile<<"\t"<<nimpurity<<"\t"<<matpurity<<"\t"<<BDT_response_2<<//"\t"<<BDT_response_2<<
"\t"<<mass<<"\t"<<totalroad<<endl;  }
	derp->Fill();
}
for(int z=0; z<number; z++){
	if(roads[z]>0){
		currentroadset->GetEntry(z);
		outfile2<<normroadid<<endl;
	}
}
cout<<stotal<<endl;
cout<<number<<endl;
//outfile->Write();
//outfile2->Close();
//myroads->cd();
//roadcurrenttree->Write("", TObject::kOverwrite);
}
