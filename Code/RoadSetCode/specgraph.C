//More graphing- produces things like road pairing frequency
//Used for road work

void specgraph(){
	//Variable declarations
	TFile *simulate= new TFile("n3_m2_bot.root","READ");
	TTree *t1= (TTree *) simulate->Get("signal");
	const int H1MAX=11;  // plus one to avoid shifting indi1ces later
	const int H2MAX=10;
	const int H3MAX=9;
	const int H4MAX=9;
	int h1t[H1MAX];
	int h2t[H2MAX];
	int h3t[H3MAX];
	int h1b[H1MAX];
	int h2b[H2MAX];
	int h3b[H3MAX];
	int h4t[H4MAX];
	int h4b[H4MAX];
	int needed=8*H2MAX*H3MAX*H4MAX;
	int needed1=4*H3MAX*H4MAX;
	int needed2=2*H4MAX;
	int needed3=1;
	const int roadnum=2*needed*H1MAX;
	int roadfreq[roadnum];
	for(int i=0; i<roadnum; i++){
		roadfreq[i]=0;
	}

	//Setting Up Branches from TTree into array
	for(int i=1; i<H1MAX; i++){
		char* tname[10];
		char* tname2[10];
		char* bname[10];
		char* bname2[10];
		char* lname[10];
		char* lname2[10];
		char* rname[10];
		char* rname2[10];
		TString arg1; 		TString arg2; 		TString arg3; 		TString arg4; 
		TString arg5; 		TString arg6; 		TString arg7; 		TString arg8; 
		sprintf(tname,"h1t%i",i);
		sprintf(tname2,"h1t%i/I",i);
		sprintf(bname,"h1b%i",i);
		sprintf(bname2,"h1b%i/I",i);
		sprintf(lname,"h1l%i",i);
		sprintf(lname2,"h1l%i/I",i);
		sprintf(rname,"h1r%i",i);
		sprintf(rname2,"h1r%i/I",i);
		arg1.Form(tname);			arg2.Form(tname2);			arg3.Form(bname);			arg4.Form(bname2);
		arg5.Form(lname);			arg6.Form(lname2);			arg7.Form(rname);			arg8.Form(rname2);
		t1->SetBranchAddress(arg5 ,&h1t[i]);
		t1->SetBranchAddress(arg7 ,&h1b[i]);
	}
	for(int i=1; i<H2MAX; i++){
		char* tname[10];
		char* tname2[10];
		char* bname[10];
		char* bname2[10];
		char* lname[10];
		char* lname2[10];
		char* rname[10];
		char* rname2[10];
		TString arg1; 		TString arg2; 		TString arg3; 		TString arg4; 
		TString arg5; 		TString arg6; 		TString arg7; 		TString arg8; 
		sprintf(tname,"h2t%i",i);
		sprintf(tname2,"h2t%i/I",i);
		sprintf(bname,"h2b%i",i);
		sprintf(bname2,"h2b%i/I",i);
		sprintf(lname,"h2l%i",i);
		sprintf(lname2,"h2l%i/I",i);
		sprintf(rname,"h2r%i",i);
		sprintf(rname2,"h2r%i/I",i);
		arg1.Form(tname);			arg2.Form(tname2);			arg3.Form(bname);			arg4.Form(bname2);
		arg5.Form(lname);			arg6.Form(lname2);			arg7.Form(rname);			arg8.Form(rname2);
		t1->SetBranchAddress(arg5 ,&h2t[i]);
		t1->SetBranchAddress(arg7 ,&h2b[i]);
	}
	for(int i=1; i<H3MAX; i++){
		char* fname1[10];
		char* fname2[10];
		char* fname3[10];
		char* fname4[10];
		sprintf(fname1,"h4Y1R%i",i);
		sprintf(fname2,"h4Y1L%i",i);
		TString arg13; 		TString arg14; 		TString arg15; 		TString arg16; 
		TString arg5; 		TString arg6; 		TString arg7; 		TString arg8; 
		arg13.Form(fname1);			arg14.Form(fname2);			arg15.Form(fname3);			arg16.Form(fname4);
		t1->Branch(arg13 ,&h3t[i]);
		t1->Branch(arg14 ,&h3b[i]);
	}
	for(int i=1; i<H4MAX; i++){
		char* fname1[10];
		char* fname2[10];
		char* fname3[10];
		char* fname4[10];
		sprintf(fname1,"h4Y2R%i",i);
		sprintf(fname2,"h4Y2L%i",i);
		TString arg13; 		TString arg14; 		TString arg15; 		TString arg16; 
		TString arg5; 		TString arg6; 		TString arg7; 		TString arg8; 
		arg13.Form(fname1);			arg14.Form(fname2);			arg15.Form(fname3);			arg16.Form(fname4);
		t1->Branch(arg13 ,&h4t[i]);
		t1->Branch(arg14 ,&h4b[i]);
	}

//start performing counting steps
int btotal=0;
vector<int> first;
vector<int> second;
vector<int> third;
vector<int> fourth;
vector<int> fifth; 
for(int x=0; x<10; x++){//(t1->GetEntries()); x++){
	t1->GetEntry(x);
	bool correct=false;
	bool correct2=false;
	bool looping=true;
	bool triggered=false;
	int check[4]={0,0,0,0};
	for(int j=1; j<H4MAX ; j++){
		if(h4t[j]>0){
			if(h4t[j]>0) { correct=true; check[0]++;}
			if(x==0) fourth.push_back(j+H4MAX);
		}
		if(h4b[j]>0){
			if(h4b[j]>0) { correct=true; check[0]++;}
			if(x==0) fourth.push_back(j);
		}
	}	
	for(int j=1; j<H3MAX ; j++){
		if(h3t[j]>0){
			if(h3t[j]>0){ correct2=true; check[1]++; }
			if(x==0) third.push_back(j+H3MAX);
		}
		if(h3b[j]>0){
			if(h3b[j]>0){ correct2=true; check[1]++; }
			if(x==0) third.push_back(j);
		}
	}	
	if(!(correct)&& !(correct2)){
//		if(x>0) continue;
		looping=false;
	}
	correct=false;
	for(int j=1; j<H2MAX ; j++){
		if(h2t[j]>0){
			if(h2t[j]>0) { correct=true; check[2]++; }
			if(x==0) second.push_back(j+H2MAX);
		}
		if(h2b[j]>0){
			if(h2b[j]>0) { correct=true; check[2]++; }
			if(x==0) second.push_back(j);
		}
	}	
	if(!(correct)){
		if(x>0) continue;
		looping=false;
	}

	correct=false;
	for(int j=1; j< H1MAX; j++){
		if(h1t[j]>0){
			if(h1t[j]>0) { correct=true; check[3]++; }
			if(x==0) first.push_back(j+H1MAX);
		}
		if(h1b[j]>0){
			if(h1b[j]>0) { correct=true; check[3]++; }
			if(x==0) first.push_back(j);
		}
	}
	int product=1;
	for(int y=0; y<4 ; y++){
		product= product*check[y];
	}
	if((!triggered)){
		btotal++;
		triggered=true;	
	}
	for(int q=0; q< first.size();q++){
		for(int r=0; r<second.size(); r++){
			if(third.size()==0){
				for(int t=0; t<fourth.size() ; t++){
					if(q==0 && t==0 && r==0)cout<<first[q]<<endl;
					int roadid=needed*first[q]-needed;
					roadid+=needed1*second[r]-needed1;
					roadid+=fourth[t]-needed3;
					roadfreq[roadid]++;
				}
			}
			else{
				for(int s=0; s<third.size() ; s++){
					if(fourth.size()!=0){
						for(int t=0; t<fourth.size() ; t++){
							if(q==0 && r==0 && t==0 && s==0)cout<<first[q]<<endl;
							int roadid=needed*first[q]-needed;
							roadid+=needed1*second[r]-needed1;
							roadid+=needed2*third[s]-needed2;
							roadid+=fourth[t]-needed3;
							roadfreq[roadid]++;
						}
					}
					else{
						if(q==0 && r==0 && s==0) cout<<first[q]<<endl;
						int roadid=needed*first[q]-needed;
						roadid+=needed1*second[r]-needed1;
						roadid+=needed2*third[s]-needed2;
						roadfreq[roadid]++;
					}
				}
			}
		}	
	}
}
int linetot=0;
vector <int> count;
for(int i=0; i<roadnum ; i++){
	if(roadfreq[i]>0){
		linetot++;
		count.push_back(i);
	}
}
const int linenum=linetot;
float linex[linenum][4];
float liney[linenum][4];
cout<<linetot<<endl;
TGraph *graph[linenum];
TMultiGraph *mg=new TMultiGraph();
for(int j=0; j<linetot ; j++){
	for(int k=0; k<4 ; k++){
		int temp;
		if(k<2) linex[j][k]=k+1;
		if(k==2){ temp=(count[j]/(needed2))%(H2MAX*2); liney[j][k]=-temp; linex[j][k]=4;}
		if(k==3){temp=(count[j]/(needed3))%(2*H3MAX); liney[j][k]=-temp; linex[j][k]=4.5;}
		if(k==0){ temp=count[j]/needed; liney[j][k]=-temp;}
		if(k==1){ temp=(count[j]/(needed1))%(2*H1MAX); liney[j][k]=-temp;}
	}
	graph[j]=new TGraph(4,linex[j],liney[j]);
	mg->Add(graph[j]);	
}
mg->Draw("ALP");
//simulate->Close();
}
