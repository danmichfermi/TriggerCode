void lrcombo() {
TCanvas* c1 = new TCanvas("c1", "c1"); 

TFile *data= new TFile("birealdata_matrix2_com","READ");
TTree *datatree= (TTree *) data->Get("signal");
TTree *databack= (TTree *) data->Get("background");
 // TFile *target = new TFile("toproad.root","RECREATE" );
//TTree *tree = new TTree("ertree","treelibrated tree");

TFile *simulate= new TFile("MCmeanedbinary.root","READ");
TTree *mcTree= (TTree *) simulate->Get("signal");
TTree *mixedTree= (TTree *) simulate->Get("background");

Float_t BDT_L;
Float_t BDT_R;
Float_t BDT_LRt;
Float_t BDT_LRb;

int plaus=0;
int plauspass=0;
int accepted=0;
int signaled=0;
float matrix1=0;
int dimuon=0;
int target=0;
int xT;
int mixacp=0;
int mixtot=0;
int mixmatacp=0;
int mixmattot=0;
int mixhightot=0;
int mixhighpass=0;
int mcacp=0;
int mctot=0;
int mcmatacp=0;
int mcmattot=0;
int mchightot=0;
int mchighpass=0;
int mixadded=0;
int mixaddedmass=0;

float mass;
float chisq;
int particleid;
int h2t[24];
int h2b[24];
int h2l[24];
int h2r[24]; 
float LRtopcut=-.24; //-.1
float LRbotcut=-.24 //-.15

//Branches Containing relevant BDT responses
TString LRbotcutbranch="longalltestbot";
TString LRtopbranch="longalltest";

/*databack->SetBranchAddress("LRtop_N3M4_N3MC_MC_LOW",&BDT_L);
//databack->SetBranchAddress("LRbotcut_N3M4_MC_N3MC_HIGH",&BDT_R);
datatree->SetBranchAddress("LRtop_N3M4_N3MC_MC_LOW",&BDT_L);
//datatree->SetBranchAddress("LRbotcut_N3M4_MC_N3MC_HIGH",&BDT_R);
databack->SetBranchAddress("LRbotcut_N3MC_MC_N3M4_LOW",&BDT_R);
datatree->SetBranchAddress("LRbotcut_N3MC_MC_N3M4_LOW",&BDT_R);
/*databack->SetBranchAddress("L_N3M4_LOW",&BDT_L);
databack->SetBranchAddress("BDT_R_N3M4_LOW",&BDT_R);
datatree->SetBranchAddress("L_N3M4_LOW",&BDT_L);
datatree->SetBranchAddress("BDT_R_N3M4_LOW",&BDT_R);*/
//LRbot
/*mixedTree->SetBranchAddress("LRtop_N3M4_N3MC_MC_LOW",&BDT_L);
//databack->SetBranchAddress("LRbotcut_N3M4_MC_N3MC_HIGH",&BDT_R);
mcTree->SetBranchAddress("LRtop_N3M4_N3MC_MC_LOW",&BDT_L);
//datatree->SetBranchAddress("LRbotcut_N3M4_MC_N3MC_HIGH",&BDT_R);
mixedTree->SetBranchAddress("LRbotcut_N3MC_MC_N3M4_LOW",&BDT_R);
mcTree->SetBranchAddress("LRbotcut_N3MC_MC_N3M4_LOW",&BDT_R);*/

databack->SetBranchAddress(LRtopbranch,&BDT_L);
datatree->SetBranchAddress(LRtopbranch,&BDT_L);
databack->SetBranchAddress(LRbotcutbranch,&BDT_R);
datatree->SetBranchAddress(LRbotcutbranch, &BDT_R);
mixedTree->SetBranchAddress(LRtopbranch, &BDT_L);
mcTree->SetBranchAddress(LRtopbranch, &BDT_L);
mixedTree->SetBranchAddress(LRbotcutbranch, &BDT_R);
mcTree->SetBranchAddress(LRbotcutbranch, &BDT_R);

//Seperating Parameters
datatree->SetBranchAddress("mass", &mass);
datatree->SetBranchAddress("xT", &xT);
mcTree->SetBranchAddress("matrix1", &matrix1);
mixedTree->SetBranchAddress("matrix1", &matrix1);
mcTree->SetBranchAddress("mass", &mass);
mixedTree->SetBranchAddress("mass", &mass);

//2d histograms
TH2F *h2 = new TH2F("h2","Left vs Right responses Real Data",20,-1,1,20,-1,1);
TH2F *h2mc = new TH2F("h2mc","Left vs Right responses Monte Carlo",20,-1,1,20,-1,1);
TH2F *h2mix = new TH2F("h2mix","Left vs Right responses Mixed MC NIM3",20,-1,1,20,-1,1);
TH2F *h2mcmassresp = new TH2F("h2mcmassresp","Mass vs Response in MC",20,-.3,.6,20,2,10);
//Actual histograms
TH1F *hxT = new TH1F("hxT","Right xT Responses",20,LRtopcut,.6);
TH1F *htarget = new TH1F("htarget","Right Target Responses",20,LRtopcut,.6);
TH1F *hmass = new TH1F("hmass","High Mass Responses",20,LRtopcut,.6);
TH1F *hchi = new TH1F("hchi","Chi Sq Cuts",20,LRtopcut,.6);
TH1F *hj = new TH1F("hj","JPsi, Psi' Candidate Responses",20,LRtopcut,.6);
TH1F *hlxT = new TH1F("hlxT","Right xT Responses",30,-.6,.6);
TH1F *hltarget = new TH1F("hltarget","Right Target Responses",30,-.6,.6);
TH1F *hlmass = new TH1F("hlmass","High Mass Responses",30,-.6,.6);
TH1F *hlj = new TH1F("hlj","JPsi, Psi' Candidate Responses",30,-.6,.6);
TH1F *hlchi = new TH1F("hlchi","Left Chi Sq Cuts",30,-.6,.6);
TH1F* hback= new TH1F("hback", "Real Data Responses", 40, -1, 1);
TH1F* hnorm= new TH1F("hnorm", "Real Data Responses", 40, -1, 1);
TH1F* hnorm2= new TH1F("hnorm2", "Real Data Responses", 40, -1, 1);
TH1F *hall = new TH1F("hvall","Right All Responses",100,-1,1);
TH2F *hgeom = new TH2F("hgeom", "Hits Hodoscope 2",17,-16, 16,17,-16,16 );
TH2F *hgeomcut = new TH2F("hgeomcut", "Hits Hodoscope 2",17,-16, 16,17,-16,16 );
TH2F *hremain = new TH2F("hremain", "Hits Hodoscope 2",17,-16, 16,17,-16,16 );
//MC histograms
TH1F *hmxmass= new TH1F("hmxmass" ,"Mixed LRtop High Mass Mat1 Resp",30,-.6,.6);
TH1F *hmxmat= new TH1F("hmxmat","Mixed LRtop Mat1 Resp",30,-.6,.6);
TH1F *hmxmass= new TH1F("hmxmass" ,"Mixed LRtop High xT No Mat1 Resp",30,-.6,.6);
TH1F *hmxmat= new TH1F("hmxmat","Mixed LRtop No Mat1 Resp",30,-.6,.6);
TH1F *hmixr= new TH1F("hmixr","Mixed LRtop Resp",30,-.6,.6);
TH1F *hmcmass= new TH1F("hmcmass" ,"MC LRtop High Mass Mat1 Resp",30,-.6,.6);
TH1F *hmcmat= new TH1F("hmcmat","MC LRtop Mat1 Resp",30,-.6,.6);
TH1F *hmcmass= new TH1F("hmcmass" ,"MC LRtop High xT No Mat1 Resp",30,-.6,.6);
TH1F *hmcmat= new TH1F("hmcmat","MC LRtop No Mat1 Resp",30,-.6,.6);
TH1F *hmcr= new TH1F("hmcr","MC LRtop Resp",30,-.6,.6);
TH2F *hgeommc = new TH2F("hgeommc", "MC Hits Hodoscope",17,-16, 16,17,-16,16 );
TH2F *hgeomcutmc = new TH2F("hgeomcutmc", "MC Hits Hodoscope Cut",17,-16, 16,17,-16,16 );

//Initiate some of the hodoscope elements0
for(int i=1; i<24; i++){
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
	datatree->SetBranchAddress(arg1 ,&h2t[i]);
	datatree->SetBranchAddress(arg3 ,&h2b[i]);
	datatree->SetBranchAddress(arg5 ,&h2l[i]);
	datatree->SetBranchAddress(arg7 ,&h2r[i]);
	databack->SetBranchAddress(arg1 ,&h2t[i]);
	databack->SetBranchAddress(arg3 ,&h2b[i]);
	databack->SetBranchAddress(arg5 ,&h2l[i]);
	databack->SetBranchAddress(arg7 ,&h2r[i]);
	mcTree->SetBranchAddress(arg1 ,&h2t[i]);
	mcTree->SetBranchAddress(arg3 ,&h2b[i]);
	mcTree->SetBranchAddress(arg5 ,&h2l[i]);
	mcTree->SetBranchAddress(arg7 ,&h2r[i]);
	mixedTree->SetBranchAddress(arg1 ,&h2t[i]);
	mixedTree->SetBranchAddress(arg3 ,&h2b[i]);
	mixedTree->SetBranchAddress(arg5 ,&h2l[i]);
	mixedTree->SetBranchAddress(arg7 ,&h2r[i]);
}
//Background Graphing Loop
for(int i=0; i< databack->GetEntries(); i++){
	databack->GetEntry(i);
	if((BDT_L>LRtopcut)&&(BDT_R>LRbotcut))	accepted++;
	hback->Fill(BDT_R);
	for(int k=0; k<46 ; k++){
		hall->Fill(BDT_R);	
	}
	mixedTree->GetEntry(i);
	h2mix->Fill(BDT_L, BDT_R);
	hmixr->Fill(BDT_L);
	mixtot++;
	if((BDT_L>LRtopcut)&&(BDT_R>LRbotcut)) mixacp++;
	if(matrix1>0){ 
		mixmattot++;
		if((BDT_L>LRtopcut)&&(BDT_R>LRbotcut)) mixmatacp++;
		hmxmat->Fill(BDT_L);
		if(mass>4.2){ 
			mixhightot++;
			hmxmass->Fill(BDT_L);
			if((BDT_L>LRtopcut)&&(BDT_R>LRbotcut)) mixhighpass++;
		}
	}
	if(matrix1==0){
		if((BDT_L>.2)&&(BDT_R>.2)){
			mixadded++;
			if(mass>4.2) 	mixaddedmass++;
		}
	}
}
for(int i=0; i< datatree->GetEntries(); i++){
	datatree->GetEntry(i);
	h2->Fill(BDT_L, BDT_R);
	hnorm->Fill(BDT_R);
	hall->Fill(BDT_R);
	if((BDT_L>LRtopcut)&&(BDT_R>LRbotcut)){	signaled++; }
	if(xT>0){ hxT->Fill(BDT_R); hlxT->Fill(BDT_L); highchi++; }
	if((mass<3.7)&&(mass>3.0)){ hj->Fill(BDT_R); hlj->Fill(BDT_L); }
	if((mass>4.2)){ hmass->Fill(BDT_R); hlmass->Fill(BDT_L); }
	if((xT>.3)) { 
		if((BDT_L>LRtopcut)&&(BDT_R>LRbotcut)){ plauspass++; hnorm->Fill(BDT_R); }
	}

	for(int x=1;x<17;x++){
		for(int y=1;y<17;y++){
			if((h2t[x]>0)&&(h2r[y]>0)){hgeom->Fill(x,y); if((BDT_L>LRtopcut)&&(BDT_R>LRbotcut)) hgeomcut->Fill(x,y);}
			if((h2t[x]>0)&&(h2l[y]>0)){hgeom->Fill(x,(y-17)); if((BDT_L>LRtopcut)&&(BDT_R>LRbotcut)) hgeomcut->Fill(x,(y-17));}
			if((h2b[x]>0)&&(h2r[y]>0)){hgeom->Fill((x-17),y); if((BDT_L>LRtopcut)&&(BDT_R>LRbotcut))hgeomcut->Fill((x-17),y);}
			if((h2b[x]>0)&&(h2l[y]>0)){hgeom->Fill((x-17),(y-17)); if((BDT_L>LRtopcut)&&(BDT_R>LRbotcut)) hgeomcut->Fill((x-17),(y-17));}
		}
	}
}
//((mass>3.7)&&(dimuon>0)&&(target>0)&&(chisq<70))
h2->Draw();
c1->SaveAs("crosscorrelation.png");
hxT->Draw();
c1->SaveAs("xTrightresp.png");
htarget->Draw();
//htarget->SetFillColor(kRed);
//c1->Update();
c1->SaveAs("targetrightresp.png");
hj->Draw();
c1->SaveAs("jmassrangeright.png");
hmass->Draw();
c1->SaveAs("highmassright.png");
hlxT->Draw();
c1->SaveAs("xTleftresp.png");
hltarget->Draw();
c1->SaveAs("targetleftresp.png");
hlj->Draw();
c1->SaveAs("jmassrangerleft.png");
hlmass->Draw();
c1->SaveAs("highmassleft.png");
hall->Draw();
c1->SaveAs("allresponse.png");
hnorm->SetFillStyle(3744);
hback->SetFillStyle(3744);
hnorm2->SetFillStyle(3744);
hback->Scale(1/(hback->Integral()),"width");
hnorm->Scale(1/(hnorm->Integral()),"width");
hnorm2->Scale(1/(hnorm2->Integral()),"width");
hback->SetFillColor(kRed);
hnorm->SetFillColor(kBlue);
hback->Draw();
hnorm->Draw("same");

hnorm->GetXaxis()->SetTitle("BDT Response");
hnorm->GetYaxis()->SetTitle("Fraction of Population");

c1->Update();
c1->SaveAs("normed.png");

hback->Draw();
c1->SaveAs("back.png");
hgeom->Draw("COLZ");
c1->SaveAs("hodo2.png");
hgeomcut->Draw("COLZ");
c1->SaveAs("hodo2cut.png");

hmxmass->Draw();
c1->SaveAs("mixhighmass.png");
hmxmat->Draw();
c1->SaveAs("mchighmassmat1.png");
hmixr->Draw();
c1->SaveAs("mixresponse.png");
hmcmass->Draw();
c1->SaveAs("mchighmass.png");
hmcmat->Draw();
c1->SaveAs("mchighmassmat1.png");
hmcr->Draw();
c1->SaveAs("mcresponse.png");
hgeom->Draw();
c1->SaveAs("MChodohits.png");
hgeomcut->Draw("COLZ");
c1->SaveAs("MChodohitcut.png"); 
h2mc->Draw("COLZ");
c1->SaveAs("MixResponseCompare.png");
h2mix->Draw("COLZ");
c1->SaveAs("Mixresponsecompare.png");
h2mcmassresp->Draw("COLZ");
c1->SaveAs("mcmassresponse.png");

float bfraction=accepted;
bfraction=bfraction/(databack->GetEntries());
cout<<"Non-Dimuon Fraction Passed"<<bfraction<<endl;
float sfraction=signaled;
sfraction=sfraction/(datatree->GetEntries());
float totalreject=sfraction*2700+bfraction* 92700;
totalreject=(1-totalreject/(2700+92700));
cout<<"Dimuon Fraction Passed"<<sfraction<<endl;
float plausfraction=plauspass;
plausfraction=plauspass/plaus;
cout<<"plaus fraction"<<plausfraction<<endl;
cout<<"plaus total"<<plaus<<endl;
cout<<"Approximate Rejection Rate"<<totalreject<<endl;

float mixacpf=mixacp;
mixacpf=mixacpf/((float) mixtot);
cout<<"Mixed Passed:"<<mixacpf<<endl;
float mixmatacpf= mixmatacp;
mixmatacpf=mixmatacpf/mixmattot;
cout<<"Mixed Passed (mat1):"<<mixmatacpf<<endl;
float mixhighpassf=mixhighpass;
mixhighpassf=mixhighpassf/((float) mixhightot);
cout<<"Mixed High Pass (mat1):"<<mixhighpassf<<endl;

float mcacpf=mcacp;
mcacpf=mcacpf/mctot;
cout<<"MC Passed:"<<mcacpf<<endl;
float mcmatacpf= mcmatacp;
mcmatacpf=mcmatacpf/mcmattot;
cout<<"MC Passed (mat1):"<<mcmatacpf<<endl;
float mchighpassf=mchighpass;
mchighpassf=mchighpassf/((float) mchightot);
cout<<"MC High Pass (mat1):"<<mchighpassf<<endl;
float addedpercent= mixadded;
addedpercent=addedpercent/(mixmattot);
cout<<"Possible Mix Added: "<<addedpercent <<endl;
float addedpercenthigh= mixaddedmass;
addedpercenthigh=addedpercenthigh/(mixmattot);
cout<<"Possible Mix Added: "<<addedpercenthigh <<endl;
//97.4
}

//83.5 low 
