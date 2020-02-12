

struct roadholder{
float back;
float sig;
float ddy;
float tjpsi;
float djpsi;
float tpp;
float dpp;
float mat;
};

void roadcontentm(){
const int treenum=6;
int subtot[treenum] = {100000, 10000, 10000,10000,10000, 10000};
TFile *data= new TFile("BDTtrain.root","READ");
TTree *signal = (TTree *) data->Get("signal");
TTree *background = (TTree *) data->Get("background");
TFile* roads = new TFile("roadsetbot.root","update","update"); 
TFile *myroads= new TFile("currentroadsets.root","update");
TTree* counttree= (TTree*)(roads->Get("roadset"));
TTree* roadset = (TTree*)(myroads->Get("78_bot"));
TFile *backzer = new TFile("MATRIX4Tree.root","READ");
TTree *backs = (TTree *) backzer->Get("MATRIX4");
myroads->cd();
TH1F *h1= new TH1F("hhits","NIM3", 200, 1,10);
TH1F *h2= new TH1F("h2","Purity- JPsi", 200, 0,10);
TH1F *h3= new TH1F("h3","Purity-Psi'", 200, 0,10);
float signorm;
float backnorm;
float matnorm;
float dumpdynorm;
float tjpsinorm;
float djpsinorm;
float tpsipnorm;
float dpsipnorm;
float nimpurity;
float dumpdypurity;
float tjpsipurity;
float djpsipurity;
float tpsippurity;
float dpsippurity;
float matpurity;
int numpass;
float mass;
TBranch *bac = roadset->Branch("backnorm2",&backnorm,"backnorm2/F");
TBranch *sig = roadset->Branch("signalnorm2",&signorm,"signalnorm2/F");
TBranch *ddn = roadset->Branch("dumpdynorm",&dumpdynorm,"dumpdynorm/F");
TBranch *tjn = roadset->Branch("tjpsinorm",&tjpsinorm,"tjpsinorm/F");
TBranch *djn = roadset->Branch("djpsinorm",&djpsinorm,"djpsinorm/F");
TBranch *tpn = roadset->Branch("tpsipnorm",&tpsipnorm,"tpsipnorm/F");
TBranch *dpn = roadset->Branch("dpsipnorm",&dpsipnorm,"dpsipnorm/F");
TBranch *mat4 = roadset->Branch("matnorm2",&matnorm,"matnorm2/F");
TBranch *nimpur = roadset->Branch("nimpurity2",&nimpurity,"nimpurity2/F");
TBranch *ddp = roadset->Branch("dumpdypurity",&dumpdypurity,"dumpdypurity/F");
TBranch *tjp = roadset->Branch("tjpsipurity",&tjpsipurity,"tjpsipurity/F");
TBranch *djp = roadset->Branch("djpsipurity",&djpsipurity,"djpsipurity/F");
TBranch *tpp = roadset->Branch("tpsippurity",&tpsippurity,"tpsippurity/F");
TBranch *dpp = roadset->Branch("dpsippurity",&dpsippurity,"dpsippurity/F");
TBranch *mat4pur = roadset->Branch("mat4purity2",&matpurity,"mat4purity2/F");
TBranch *num = roadset->Branch("num2", &numpass ,"num2/I");
TBranch *mas = roadset->Branch("mass2", &mass ,"mass2/F");
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
int particleid;
int countroadid;
roadset->SetBranchAddress("roadid",&countroadid);	
signal->SetBranchAddress("particleid",&particleid);
signal->SetBranchAddress("mass",&mass);
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
		data->cd();
		signal->SetBranchAddress(arg3, &h1t[i]);
		background->SetBranchAddress(arg3, &h1t[i]);
		myroads->cd();
		roadset->SetBranchAddress(arg3, &ch1t[i]);
		backzer->cd();
		backs->SetBranchAddress(arg3, &h1t[i]);
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
//		arg1.Form(tname);			arg3.Form(tname2);		
		arg3.Form(bname);			arg4.Form(bname2);
		data->cd();
		signal->SetBranchAddress(arg3, &h2t[i]);
		background->SetBranchAddress(arg3, &h2t[i]);
		myroads->cd();
		roadset->SetBranchAddress(arg3, &ch2t[i]);
		backzer->cd();
		backs->SetBranchAddress(arg3, &h2t[i]);
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
//		arg1.Form(tname);		arg3.Form(tname2);			
		arg3.Form(bname);			arg4.Form(bname2);
		data->cd();
		signal->SetBranchAddress(arg3, &h3t[i]);
		background->SetBranchAddress(arg3, &h3t[i]);
		myroads->cd();
		roadset->SetBranchAddress(arg3, &ch3t[i]);
		backzer->cd();
		backs->SetBranchAddress(arg3, &h3t[i]);
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
//		arg1.Form(tname);			arg2.Form(tname2);
		arg3.Form(bname);			arg4.Form(bname2);
		data->cd();
		signal->SetBranchAddress(arg3, &h4tu[i]);
		background->SetBranchAddress(arg3, &h4tu[i]);
		myroads->cd();
		roadset->SetBranchAddress(arg3, &ch4tu[i]);
		backzer->cd();
		backs->SetBranchAddress(arg3, &h4tu[i]);
}
myroads->cd();
int setsize=counttree->GetEntries();
const int nnn=setsize;
int needed;
needed=setsize;
cout<<needed<<endl;
needed=needed/23;
int needed1=needed/16;
int needed2=needed1/16;
int needed3=needed2/16;
int needed4=needed3/16;
roadholder filler[nnn];
int passedsignal[nnn];
float masssum[nnn];
int huh=0;

//Prebuilt roadset reorganize the order remove this for general road
int Nroadset=roadset->GetEntries();
const int nn=Nroadset;
int IDhold[nn];
int IDordered[nn];
int Nindex[nn];
for(int j=0; j<nn ; j++){
	roadset->GetEntry(j);
	IDhold[j]=countroadid;
}
/*vector<int> idorder(0, nn);
for(int j=0; j<nn ; j++){
	idorder[j]=IDordered[j];
}*/
//std::sort (idorder.begin() , idorder.end() );
TMath::Sort(nn, IDhold, IDordered);
for(int j=0; j<nn ; j++){
	roadset->GetEntry((IDordered[nn-j]));
//	cout<<countroadid<<endl;
}
for(int k=0; k<nnn; k++){
	filler[k].back=0;
	filler[k].sig=0;
	filler[k].ddy=0;
	filler[k].tjpsi=0;
	filler[k].djpsi=0;
	filler[k].tpp=0;
	filler[k].dpp=0;
	filler[k].mat=0;
	passedsignal[k]=0;
	masssum[k]=0;
}
data->cd();
for(int i=0; i<background->GetEntries() ; i++){
	bool triggered=false;
	vector<int> first;
	vector<int> second;
	vector<int> third;
	vector<int> fourth;
	vector<int> fifth; 

	background->GetEntry(i);
	bool correct=false;
	bool looping=true;
	int check[4]={0,0,0,0};
	int backx=0; 
	for(int j=1; j<17 ; j++){
		if(h4tu[j]>0){
			if(ch4tu[j]>0) { correct=true; }
			fourth.push_back(j);
		}
	}	
	if(!(correct)){
		//continue;
		looping=false;
	}
	correct=false;
	for(int j=1; j<17 ; j++){
			if(h3t[j]>0){
				if(ch3t[j]>0){ correct=true; }
				third.push_back(j);
			}
		}	
		if(!(correct)){
			//continue;
			looping=false;
		}
	correct=false;
	for(int j=1; j<17 ; j++){
		if(h2t[j]>0){
			if(ch2t[j]>0) { correct=true; }
			second.push_back(j);
		}
	}	
	if(!(correct)){
		//continue;
		looping=false;
	}
	correct=false;
	for(int j=1; j< 24; j++){
		if(h1t[j]>0){
			if(ch1t[j]>0) { correct=true; }
			first.push_back(j);
		}
	}
	if(!correct) //continue;
	int completed=0;
	for(int q=0; q< first.size();q++){
		for(int r=0; r<second.size(); r++){
			for(int s=0; s<third.size() ; s++){
				for(int t=0; t<fourth.size() ; t++){
					int roadid=needed*first[q]-needed;
					roadid+=needed1*second[r]-needed1;
					roadid+=needed2*third[s]-needed2;
					roadid+=fourth[t]-needed3;
					filler[roadid].back+=1;
					huh+=1;
				}
			}
		}	
	}
}
backzer->cd();
for(int i=0; i<backs->GetEntries() ; i++){
	bool triggered=false;
	vector<int> first;
	vector<int> second;
	vector<int> third;
	vector<int> fourth;
	vector<int> fifth; 
	backs->GetEntry(i);
	bool correct=false;
	bool looping=true;
	int check[4]={0,0,0,0};
	int backx=0; 
	for(int j=1; j<17 ; j++){
		if(h4tu[j]>0){
			if(ch4tu[j]>0) { correct=true; }
			fourth.push_back(j);
		}
	}	
	if(!(correct)){
		//continue;
		looping=false;
	}
	correct=false;
	for(int j=1; j<17 ; j++){
			if(h3t[j]>0){
				if(ch3t[j]>0){ correct=true; }
				third.push_back(j);
			}
			
		if(!(correct)){
			//continue;
			looping=false;
		}
	}
	correct=false;
	for(int j=1; j<17 ; j++){
		if(h2t[j]>0){
			if(ch2t[j]>0) { correct=true; }
			second.push_back(j);
		}
	}	
	if(!(correct)){
		//continue;
		looping=false;
	}
	correct=false;
	for(int j=1; j< 24; j++){
		if(h1t[j]>0){
			if(ch1t[j]>0) { correct=true; }
			first.push_back(j);
		}
	}
	if(!correct) //continue;
	int completed=0;
	for(int q=0; q< first.size();q++){
		for(int r=0; r<second.size(); r++){
			for(int s=0; s<third.size() ; s++){
				for(int t=0; t<fourth.size() ; t++){
					int roadid=needed*first[q]-needed;
					roadid+=needed1*second[r]-needed1;
					roadid+=needed2*third[s]-needed2;
					roadid+=fourth[t]-needed3;
					filler[roadid].mat+=1;
				}
			}
		}	
	}
}
//cout<<Nroadset<<endl;
data->cd();
for(int i=0; i<signal->GetEntries() ; i++){
	bool stupid=false;
	bool triggered=false;
	vector<int> first;
	vector<int> second;
	vector<int> third;
	vector<int> fourth;
	vector<int> fifth; 
	signal->GetEntry(i);
	bool correct=false;
	bool looping=true;
	int check[4]= {0,0,0,0};
	for(int j=1; j<17 ; j++){
		if(h4tu[j]>0){
			if(ch4tu[j]>0) { correct=true; check[0]+=1;}
			fourth.push_back(j);
		}
	}	
	if(!(correct)){
		//continue;
		looping=false;
	}
	correct=false;
	for(int j=1; j<17 ; j++){
		if(h3t[j]>0){
			if(ch3t[j]>0){ correct=true; check[1]+=1; }
			third.push_back(j);
		}
	}	
	if(!(correct)){
		//continue;
		looping=false;
	}
	correct=false;
	for(int j=1; j<17 ; j++){
		if(h2t[j]>0){
			if(ch2t[j]>0) { correct=true; check[2]+=1; }
			second.push_back(j);
		}
	}	
	if(!(correct)){
		//continue;
		looping=false;
	}
	correct=false;
	for(int j=1; j< 24; j++){
		if(h1t[j]>0){
			if(ch1t[j]>0) { correct=true; check[3]+=1; }
			first.push_back(j);
		}
	}
	for(int q=0; q< first.size();q++){
		for(int r=0; r<second.size(); r++){
			for(int s=0; s<third.size() ; s++){
				for(int t=0; t<fourth.size() ; t++){
					int roadid=needed*first[q]-needed;
					roadid+=needed1*second[r]-needed1;
					roadid+=needed2*third[s]-needed2;
					roadid+=fourth[t]-needed3;
					if(particleid==0){ filler[roadid].sig+=1; masssum[roadid]= masssum[roadid]+ mass; } 
					if(particleid==1) filler[roadid].ddy+=1;
					if(particleid==2)filler[roadid].tjpsi+=1;
					if(particleid==3) filler[roadid].djpsi+=1;
					if(particleid==4) filler[roadid].dpp+=1;
					if(particleid==5) filler[roadid].tpp+=1;
				}
			}
		}	
	}
}
cout<<"signal done"<<endl;
int reducedsetcounter=0;
myroads->cd();
int previous=0;

for(int k=0; k<(nnn); k++){
//	if(reducedsetcounter>0) cout<<reducedsetcounter; 
	roadset->GetEntry((IDordered[nn-reducedsetcounter]));
//	if(previous!=countroadid){ previous =countroadid; cout<<endl; cout<<previous<<"\t"<<k<<endl;
//		cout<<reducedsetcounter; }
//	cout<<k<<endl;
	if(k>(countroadid-1)){
		cout<<"why"<<endl;
		backnorm=filler[k].back;
		backnorm=backnorm;
		matnorm=filler[k].mat;
		matnorm=matnorm/(backs->GetEntries());
		signorm=filler[k].sig;
		h1->Fill(filler[k].sig);
		h2->Fill(filler[k].back);
		if(filler[k].sig>0) mass=masssum[k]/filler[k].sig;
		dumpdynorm=filler[k].ddy;
		dumpdynorm=dumpdynorm/subtot[1];
		h3->Fill(signorm);
		tjpsinorm=filler[k].tjpsi;
		tjpsinorm=tjpsinorm/subtot[2];
		djpsinorm=filler[k].djpsi;
		djpsinorm=djpsinorm/subtot[3];
		tpsipnorm=filler[k].dpp;
		tpsipnorm=tpsipnorm/subtot[4];
		dpsipnorm=filler[k].tpp;
		dpsipnorm=dpsipnorm/subtot[5];
		bac->Fill();
		sig->Fill();
		ddn->Fill();
		tjn->Fill();
		djn->Fill();
		tpn->Fill();
		dpn->Fill();
		numpass=filler[k].sig;
		num->Fill();
		if((backnorm+signorm)>0){ nimpurity=signorm/(backnorm+signorm); }	//prevents dividing by zero
		else{ nimpurity=-1;}
		if((matnorm+signorm)>0){ matpurity=signorm/(matnorm+signorm); }
		else{ matpurity=-1;}
		if((dumpdynorm+signorm)>0){ dumpdypurity=signorm/(dumpdynorm+signorm); }
		else{ dumpdypurity=-1;}
		if((tjpsinorm+signorm)>0){ tjpsipurity=signorm/(tjpsinorm+signorm);}
		else{ tjpsipurity=-1;}
		if((djpsinorm+signorm)>0){ djpsipurity=signorm/(djpsinorm+signorm);}
		else{ djpsipurity=-1;}
		if((tpsipnorm+signorm)>0){tpsippurity=signorm/(tpsipnorm+signorm);}
		else{ tpsippurity=-1;}
		if((dpsipnorm+signorm)>0){dpsippurity=signorm/(dpsipnorm+signorm);}
		else{ dpsippurity=-1;}
		nimpur->Fill();
		ddp->Fill();
		tjp->Fill();
		djp->Fill();
		tpp->Fill();
		dpp->Fill();
		mat4->Fill();
		mat4pur->Fill();
		mas->Fill();
		reducedsetcounter++;
	}
	if(reducedsetcounter>(Nroadset)){ cout<<endl; break;}

}
cout<<needed<<endl;
//h1->Draw();
cout<<reducedsetcounter<<endl;
myroads->cd();
roadset->Write("", TObject::kOverwrite);
}
//bottom is 77:.14185; .7237; 7119; 3883
