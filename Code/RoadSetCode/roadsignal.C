void roadsignal(){
//need both real and not real
//need to figure out way to run through all brute? 
//modular arithmetic? mod(17) mod(17^2) run through others for each?
//need more effeicient algorithm for sure
//first step is to fill in data
//stations broken into individual modules - up and down
//new road sets



//technique issues .0154 and .5527 (apparent increase in run time)
//technique use boolean only yields .99995 and .9999 
//.1109 .58445 57? ; .143 .697 77 ; 14.5425 70.205
//.0156 ; .576233 -57 5694,5308
//
TFile *data= new TFile("BDTMATRIX1v3.root","READ");
TTree *signal = (TTree *) data->Get("signal");
TTree *background = (TTree *) data->Get("background");
TFile* myroads = new TFile("roadsettop.root","READ"); 
TTree* myroadtree = (TTree*)(myroads->Get("roadset"));
TFile* road57 = new TFile("currentroadsets.root","READ"); 
TTree *roadcurrenttree = (TTree*)(road57->Get("76"));
TH1F *h1= new TH1F("h1","Dimuon Background ", 200, -1.0,1);
TH1F *h2= new TH1F("h2","Dimuon Signal", 200, -1.0,1);
TH1F *h3= new TH1F("h3","Dimuon Signal Eff", 200, -1.0,1);
TH1F *h4= new TH1F("h4","Dimuon response distribution", 200, -1.0,1);

int backcount;
int btotal=0;
int backddiff=0;
int signalddiff=0;
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
	float BDT;
	myroadtree->SetBranchAddress("BDT_NIM3_2",&BDT);	

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
		arg1.Form(tname);			arg3.Form(tname2);//			arg3.Form(bname);			arg4.Form(bname2);
		signal->SetBranchAddress(arg3, &h1t[i]);
		background->SetBranchAddress(arg3, &h1t[i]);
		roadcurrenttree->SetBranchAddress(arg3, &ch1t[i]);
		myroadtree->SetBranchAddress(arg3, &ch1t[i]);
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
		arg1.Form(tname);			arg3.Form(tname2);		//	arg3.Form(bname);			arg4.Form(bname2);
		signal->SetBranchAddress(arg3, &h2t[i]);
		background->SetBranchAddress(arg3, &h2t[i]);
		roadcurrenttree->SetBranchAddress(arg3, &ch2t[i]);
		myroadtree->SetBranchAddress(arg3, &ch2t[i]);
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
		arg1.Form(tname);		arg3.Form(tname2);			//arg3.Form(bname);			arg4.Form(bname2);
		signal->SetBranchAddress(arg3, &h3t[i]);
		background->SetBranchAddress(arg3, &h3t[i]);
		roadcurrenttree->SetBranchAddress(arg3, &ch3t[i]);
		myroadtree->SetBranchAddress(arg3, &ch3t[i]);
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
		signal->SetBranchAddress(arg3, &h4tu[i]);
		background->SetBranchAddress(arg3, &h4tu[i]);
		roadcurrenttree->SetBranchAddress(arg3, &ch4tu[i]);
		myroadtree->SetBranchAddress(arg3, &ch4tu[i]);
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
		signal->SetBranchAddress(arg3, &h4td[i]);
		background->SetBranchAddress(arg3, &h4td[i]);
		roadcurrenttree->SetBranchAddress(arg3, &ch4td[i]);
		myroadtree->SetBranchAddress(arg3, &ch4td[i]);
}

int needed=myroadtree->GetEntries();
//	needed=needed-needed%23;
needed=needed/23;
int needed1=needed/16;
int needed2=needed1/16;
int needed3=needed2/16;
int needed4=needed3/16;
	
for(int i=0; i<background->GetEntries() ; i++){
	bool triggered=false;
	background->GetEntry(i);

/*		for(int k=1; k<17; k++){
			h4tu[k]=1;
		} 
		for(int k=1; k<17; k++){
			h2t[k]=1;
		} 
		for(int k=1; k<24; k++){
			h1t[k]=1;
		} */   //96% without 3

	vector<int> first;
	vector<int> second;
	vector<int> third;
	vector<int> fourth;
	vector<int> fifth; 
	for(int x=0; x<(roadcurrenttree->GetEntries()); x++){
		roadcurrenttree->GetEntry(x);
		bool correct=false;
		bool looping=true;
		int check[4]={0,0,0,0};
		for(int j=1; j<17 ; j++){
			if(h4tu[j]>0){
				if(ch4tu[j]>0) { correct=true; check[0]++;}
				if(x==0) fourth.push_back(j);
			}
		}	
		if(!(correct)){
			if(x>0) continue;
			looping=false;
		}
		correct=false;
		for(int j=1; j<17 ; j++){
			if(h3t[j]>0){
				if(ch3t[j]>0){ correct=true; check[1]++; }
				if(x==0) third.push_back(j);
			}
		}	
		if(!(correct)){
			if(x>0) continue;
			looping=false;
		}
		correct=false;
		for(int j=1; j<17 ; j++){
			if(h2t[j]>0){
				if(ch2t[j]>0) { correct=true; check[2]++; }
				if(x==0) second.push_back(j);
			}
		}	
		if(!(correct)){
			if(x>0) continue;
			looping=false;
		}
		correct=false;
		for(int j=1; j< 24; j++){
			if(h1t[j]>0){
				if(ch1t[j]>0) { correct=true; check[3]++; }
				if(x==0) first.push_back(j);
			}
		}
//		if(!(correct)||!(looping)) continue;
		int product=1;
		for(int y=0; y<4 ; y++){
			product= product*check[y];
		}

		if((!triggered)&&(product>0)){
/*		for(int j=1; j<17 ; j++){
			if(h4tu[j]>0){
				if(ch4tu[j]>0) { correct=true; }
				if(x==0) fourth.push_back(j);
			}
		}	
		if(!(correct)){
			if(x>0) continue;
			looping=false;
		}
		correct=false;
		for(int j=1; j<17 ; j++){
			if(h3t[j]>0){
				if(ch3t[j]>0){ correct=true; }
				if(x==0) third.push_back(j);
			}
		}	
		if(!(correct)){
			if(x>0) continue;
			looping=false;
		}
		correct=false;
		for(int j=1; j<17 ; j++){
			if(h2t[j]>0){
				if(ch2t[j]>0) { correct=true;  }
				if(x==0) second.push_back(j);
			}
		}	
		if(!(correct)){
			if(x>0) continue;
			looping=false;
		}
		correct=false;
		for(int j=1; j< 24; j++){
			if(h1t[j]>0){
				if(ch1t[j]>0) { correct=true; }
				if(x==0) first.push_back(j);
			}
		}
		if(!(triggered) &&(!(correct)||!(looping))){*/
			btotal++;
			triggered=true;	
		}
	}
//	for(int j=0; j<17 ; j++){
//		if(h4td[j]>0)}
/*	for(int u=1; u<17; u++){
		if(h4td[u]>0) fifth.push_back(u);
	}	*/
	for(int u=0; u<fourth.size(); u++){
		if(h4tu[fourth[u]] !=h4td[fourth[u]]  ) backddiff++;
	}
//	cout<<myroadtree->GetEntries()<<endl;
	for(int q=0; q< first.size();q++){
		if(q==1) break;
		for(int r=0; r<second.size(); r++){
			for(int s=0; s<third.size() ; s++){
				for(int t=0; t<fourth.size() ; t++){
//					for(int u=0; u<fifth.size(); u++){
						int roadid=needed*first[q]-needed;
						roadid+=needed1*second[r]-needed1;
						roadid+=needed2*third[s]-needed2;
						roadid+=fourth[t]-needed3;
//						roadid+=needed4*fifth[u]-needed4;
						myroadtree->GetEntry(roadid);
						h1->Fill(BDT);
//					}
				}
			}
		}	
	}
}
cout<<h1->GetEntries()<<endl;
float backeff =  btotal;
float dude=backddiff;
backeff= backeff/(background->GetEntries());
cout<<backeff<<endl;
cout<<dude/(background->GetEntries())<<endl;
int stotal=0;
for(int i=0; i< signal->GetEntries() ; i++){
	bool triggered=false;
	signal->GetEntry(i);
	vector<int> first;
	vector<int> second;
	vector<int> third;
	vector<int> fourth;
	vector<int> fifth; 
	for(int x=0; x<(roadcurrenttree->GetEntries()); x++){
		roadcurrenttree->GetEntry(x);
		bool correct=false;
		bool looping=true;
		int check[4]= {0,0,0,0};
/*		for(int j=1; j<17 ; j++){
			if(h4tu[j]>0){
				if(ch4tu[j]>0) { correct=true; }
				if(x==0) fourth.push_back(j);
			}
		}	
		if(!(correct)){
			if(x>0) continue;
			looping=false;
		}
		correct=false;
		for(int j=1; j<17 ; j++){
			if(h3t[j]>0){
				if(ch3t[j]>0){ correct=true; }
				if(x==0) third.push_back(j);
			}
		}	
		if(!(correct)){
			if(x>0) continue;
			looping=false;
		}
		correct=false;
		for(int j=1; j<17 ; j++){
			if(h2t[j]>0){
				if(ch2t[j]>0) { correct=true;  }
				if(x==0) second.push_back(j);
			}
		}	
		if(!(correct)){
			if(x>0) continue;
			looping=false;
		}
		correct=false;
		for(int j=1; j< 24; j++){
			if(h1t[j]>0){
				if(ch1t[j]>0) { correct=true; }
				if(x==0) first.push_back(j);
			}
		}
		if(!(triggered) &&(!(correct)||!(looping))){ */
		for(int j=1; j<17 ; j++){
			if(h4tu[j]>0){
				if(ch4tu[j]>0) { correct=true; check[0]++;}
				if(x==0) fourth.push_back(j);
			}
		}	
		if(!(correct)){
			if(x>0) continue;
			looping=false;
		}
		correct=false;
		for(int j=1; j<17 ; j++){
			if(h3t[j]>0){
				if(ch3t[j]>0){ correct=true; check[1]++; }
				if(x==0) third.push_back(j);
			}
		}	
		if(!(correct)){
			if(x>0) continue;
			looping=false;
		}
		correct=false;
		for(int j=1; j<17 ; j++){
			if(h2t[j]>0){
*				if(ch2t[j]>0) { correct=true; check[2]++; }
				if(x==0) second.push_back(j);
			}
		}	
		if(!(correct)){
			if(x>0) continue;
			looping=false;
		}
		correct=false;
		for(int j=1; j< 24; j++){
			if(h1t[j]>0){
				if(ch1t[j]>0) { correct=true; check[3]++; }
				if(x==0) first.push_back(j);
			}
		}
//		if(!(correct)||!(looping)) continue;
		int product=1;
		for(int y=0; y<4 ; y++){
			product= product*check[y];
		} 
		if((!triggered)&&(product>0)){
			stotal++;
			triggered=true;	
		}
	}
	

//	for(int j=0; j<17 ; j++){
//		if(h4td[j]>0)
//	}
//	for(int u=1; u<17; u++){
//		if(h4td[u]>0) fifth.push_back(u);
//	}
	for(int u=0; u<fourth.size(); u++){
		if(h4tu[fourth[u]] !=h4td[fourth[u]]  ) signalddiff++;
	}
	for(int q=0; q< first.size();q++){
		if(q==1) break;
		for(int r=0; r<second.size(); r++){
			for(int s=0; s<third.size() ; s++){
				for(int t=0; t<fourth.size() ; t++){
//					for(int u=0; u<fifth.size(); u++){
						int roadid=needed*first[q]-needed;
						roadid+=needed1*second[r]-needed1;
						roadid+=needed2*third[s]-needed2;
						roadid+=needed3*fourth[t]-needed3;
//						roadid+=needed4*fifth[u]-needed4;
						myroadtree->GetEntry(roadid);
						h2->Fill(BDT);
//					}
				}
			}
		}	
	}
}
TCanvas* c1 = new TCanvas("c1", "c1"); 
h1->Draw();
h1->SetLineColor(kRed);
c1->SaveAs("Road_Background_Performance.png");
h2->Draw();
h2->SetLineColor(kBlue);
c1->SaveAs("Road_Signal_Performance.png");
float xz[200]; 
float yz[200];
ofstream outfile ("roadsettest_botNIM3_2.dat");
for(int i=0; i<200; i++){
		float v =-1.0+ i*.01;
		float her;
		her =(h2->Integral(i, 200 ));
		float ver = (h1->Integral(0, i));
		h3->Fill(v+.001, her/(h2->GetEntries()));
		outfile<<her/(h2->GetEntries())<<"\t";
		outfile<<ver/(h1->GetEntries())<<endl;
		h4->Fill(v+.001, ver/(h1->GetEntries()));
		xz[i]=her/(h2->GetEntries());
		yz[i]=ver/(h1->GetEntries()) ;
}
TGraph *err = new TGraph(200,xz,yz);
outfile.close();
h3->Draw();
h3->SetLineColor(kRed);
h4->Draw("Same");
h4->SetLineColor(kBlue);
c1->SaveAs("Road_Blue_Eff.png");
err->Draw("ACP");
c1->SaveAs("Eff_Curve.png");
float signaleff= stotal;
float herro= signalddiff;
signaleff= signaleff/(signal->GetEntries());
cout<<signaleff<<"\t"<<signal->GetEntries()<<endl;
cout<<herro/(signal->GetEntries())<<endl;
}
//bottom is 77:.14185; .7237; 7119; 3883
