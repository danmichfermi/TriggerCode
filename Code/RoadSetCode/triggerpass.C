//Function Used to determine road passage rates
//can be applied to or from any roadset loaded onto a root file with the normal naming convention



void triggerpass(){
TFile *data= new TFile("MonteCarloTreesBinary.root","update");
TTree *signal = (TTree *) data->Get("mc_drellyan_LD2_M014_S018");
int matrix;
TBranch *mat = signal-> Branch("toptest",  &matrix, "toptest/I");
TFile* roadfile = new TFile("currentroadsets.root","READ"); 
TFile *roadindexf = new TFile("roadset.root","READ");
TTree *myroads= (TTree*) roadindexf->Get("roadset");
TTree *triggerroad = (TTree*)(roadfile->Get("77"));

const int H1MAX=24;  // plus one to avoid shifting indi1ces later
const int H2MAX=17;
const int H3MAX=17;
const int H4MAX=17;
int h1t[H1MAX];
int h2t[H2MAX];
int h3t[H3MAX];
int h4tu[H4MAX];
int h4td[H4MAX];
float ch1t[H1MAX];
float ch2t[H2MAX];
float ch3t[H3MAX];
float ch4tu[H4MAX];
float ch4td[H4MAX];
float xh1t[H1MAX];
float xh2t[H2MAX];
float xh3t[H3MAX];
float xh4tu[H4MAX];
float xh4td[H4MAX];
float BDT;
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
		arg1.Form(tname);			arg3.Form(tname2);		//	arg3.Form(bname);			arg4.Form(bname2);
		if(i>1) data->cd();
		signal->SetBranchAddress(arg3, &h1t[i]);
		//background->SetBranchAddress(arg3, &h1t[i]);
		roadfile->cd();
		triggerroad->SetBranchAddress(arg3, &xh1t[i]);
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
		arg1.Form(tname);			arg3.Form(tname2);//			arg3.Form(bname);			arg4.Form(bname2);
		data->cd();
		signal->SetBranchAddress(arg3, &h2t[i]);
		//background->SetBranchAddress(arg3, &h2t[i]);
		roadfile->cd();
		triggerroad->SetBranchAddress(arg3, &xh2t[i]);
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
		arg1.Form(tname);			arg3.Form(tname2);//			arg3.Form(bname);			arg4.Form(bname2);
		data->cd();
		signal->SetBranchAddress(arg3, &h3t[i]);
		//background->SetBranchAddress(arg3, &h3t[i]);
		roadfile->cd();
		triggerroad->SetBranchAddress(arg3, &xh3t[i]);
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
		arg1.Form(tname);			arg3.Form(tname2);//			arg3.Form(bname);			arg4.Form(bname2);
		data->cd();
		signal->SetBranchAddress(arg3, &h4tu[i]);
		//background->SetBranchAddress(arg3, &h4tu[i]);
		roadfile->cd();
		triggerroad->SetBranchAddress(arg3, &xh4tu[i]);
}
for(int i=1; i<17 ; i++){
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
		data->cd();
		signal->SetBranchAddress(arg3, &h4td[i]);
		//background->SetBranchAddress(arg3, &h4td[i]);
		roadfile->cd();
		triggerroad->SetBranchAddress(arg3, &xh4td[i]);
}
int needed=myroads->GetEntries();
needed=needed/23;
int needed1=needed/16;
int needed2=needed1/16;
int needed3=needed2/16;
int needed4=needed3/16;
int jerk=triggerroad->GetEntries();
const int loopentries= jerk;
int roadlist77[loopentries];
for(int x=0; x<loopentries; x++){
		triggerroad->GetEntry(x);
		bool correct=false;
		bool looping=true;
		int check[4]={0,0,0,0};
		int xcheck[4]={0,0,0,0};
		vector<int> first;
	vector<int> second;
	vector<int> third;
	vector<int> fourth;
	vector<int> fifth; 
		for(int j=1; j<17 ; j++){
				if(xh4tu[j]>0) { correct=true; xcheck[0]++; fourth.push_back(j);}
		}	
		if(!(correct)){
			if(x>0) continue;
			looping=false;
		}
		correct=false;
		for(int j=1; j<17 ; j++){
			if(h3t[j]>0){
				if(xh3t[j]>0){ correct=true; xcheck[1]++;third.push_back(j); }
				//if(x==0) 
			}
		}	
		if(!(correct)){
			if(x>0) continue;
			looping=false;
		}
		correct=false;
		for(int j=1; j<17 ; j++){
			if(h2t[j]>0){
				if(xh2t[j]>0) { correct=true; xcheck[2]++; second.push_back(j); }
				//if(x==0) 
			}
		}	
		if(!(correct)){
			if(x>0) continue;
			looping=false;
		}
		correct=false;
		for(int j=1; j< 24; j++){
			if(h1t[j]>0){
				if(xh1t[j]>0) { correct=true; xcheck[3]++; first.push_back(j);}
				//if(x==0) 
			}
		}
		int xproduct=1;
		for(int y=0; y<4 ; y++){
			xproduct= xproduct*xcheck[y];
		}
		if(!xproduct) cout<<x<<"\t"<< xh1t<<endl;
//		if(!(correct)||!(looping)) continue;
/*	for(int u=0; u<fourth.size(); u++){
		if(h4tu[fourth[u]] !=h4td[fourth[u]]  ) signalddiff++;
	}*/
	for(int q=0; q< first.size();q++){
		for(int r=0; r<second.size(); r++){
			for(int s=0; s<third.size() ; s++){
				for(int t=0; t<fourth.size() ; t++){
					int roadid=needed*first[q]-needed;
					roadid+=needed1*second[r]-needed1;
					roadid+=needed2*third[s]-needed2;
					roadid+=needed3*fourth[t]-needed3;
					roadlist77[x]=roadid;
				}
			}
		}	
	}
}
int wrong=0;
for(int x=0; x<signal->GetEntries(); x++){
		signal->GetEntry(x);
		bool correct=false;
		bool looping=true;
		int check[4]={0,0,0,0};
		int xcheck[4]={0,0,0,0};
		vector<int> first;
	vector<int> second;
	vector<int> third;
	vector<int> fourth;
	vector<int> fifth; 
		for(int j=1; j<17 ; j++){
			if(h4tu[j]>0){
				if(xh4tu[j]>0) { correct=true; xcheck[0]++; fourth.push_back(j);}
				
			}
		}	
		if(!(correct)){
			if(x>0) continue;
			looping=false;
		}
		correct=false;
		for(int j=1; j<17 ; j++){
			if(h3t[j]>0){
				if(xh3t[j]>0){ correct=true; xcheck[1]++;third.push_back(j); }
				//if(x==0) 
			}
		}	
		if(!(correct)){
			if(x>0) continue;
			looping=false;
		}
		correct=false;
		for(int j=1; j<17 ; j++){
			if(h2t[j]>0){
				if(xh2t[j]>0) { correct=true; xcheck[2]++; second.push_back(j); }
				//if(x==0) 
			}
		}	
		if(!(correct)){
			if(x>0) continue;
			looping=false;
		}
		correct=false;
		for(int j=1; j< 24; j++){
			if(h1t[j]>0){
				if(xh1t[j]>0) { correct=true; xcheck[3]++; first.push_back(j);}
				//if(x==0) 
			}
		}
		int product=1;
		int xproduct=1;
		for(int y=0; y<4 ; y++){
			xproduct= xproduct*xcheck[y];
		}
		if((xproduct<1)){
			matrix=0;
			mat->Fill();
			wrong++;
			continue;	
		}
	for(int q=0; q< first.size();q++){
		for(int r=0; r<second.size(); r++){
			for(int s=0; s<third.size() ; s++){
				for(int t=0; t<fourth.size() ; t++){
					int roadid=needed*first[q]-needed;
					roadid+=needed1*second[r]-needed1;
					roadid+=needed2*third[s]-needed2;
					roadid+=needed3*fourth[t]-needed3;
					matrix=0;
					for(int y=0; y<loopentries; y++){
						if(roadlist77[y]<=roadid) matrix=1;
					}
				 	mat->Fill();
				}
			}
		}	
	}
}
cout<<wrong<<endl;
data->cd();
signal->Write("",TObject::kOverwrite);
}
