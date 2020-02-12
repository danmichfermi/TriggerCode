//Special Graph maker used to generate stats, distros
//Used for evaluation
//Perphas Error?

void lrcombo() {
TCanvas* c1 = new TCanvas("c1", "c1"); 
TFile *data= new TFile("birealdata_matrix2_com.root", "READ");
//TFile *data= new TFile("birealdatasplit2_new.root","READ");
TTree *datatree= (TTree *) data->Get("signal");
TTree *databack= (TTree *) data->Get("background");
 // TFile *target = new TFile("toproad.root","RECREATE" );
//TTree *tree = new TTree("ertree","treelibrated tree");

//TFile *simulate= new TFile("BDT_n3_mc_run5.root","update");
TFile *simulate= new TFile("n3mc_m2_bot.root","READ");
TTree *mcTree= (TTree *) simulate->Get("signal");
TTree *mixedTree= (TTree *) simulate->Get("background");

Float_t BDT_L;
Float_t BDT_R;
Float_t BDT_LRt;
Float_t BDT_LRb;

int topbot;
int plaus=0;
int plauspass=0;
int accepted=0;
int signaled=0;
int matrix1=1;
int dimuon=0;
int target=0;
int valid;
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
int mcxTnomat1pass=0;
int mcxTnomat1=0;
int mcxTmat1=0;
int mcxTmat1pass=0;
int mcxThighall=0;
int mcxThighpass=0;
int mcxTall=0;
int mcxTpass=0;
float wmcxTnomat1pass=0;
float wmcxTnomat1=0;
float wmcxTmat1=0;
float wmcxTmat1pass=0;
float wmcxThighall=0;
float wmcxThighpass=0;
float wmcxTall=0;
float wmcxTpass=0;

float xT;
float mass;
float chisq;
float weight;
int particleid;
int h2t[24];
int h2b[24];
int h2l[24];
int h2r[24]; 
int h4t[24];
int h4b[24];
int h4l[24];
int h4r[24]; 
float LRtoplow=0; //-.1
float LRbotlow=0; //-.15 
float LRtopcut=-1;  //-.1 for high xt accept, .07   BDT_L
float LRbotcut= -.0625; //-.15  	BDT_R

//Branches Containing relevant BDT responses
TString LRbotcutbranch="LRbot_M2_N3MC_sigma_true";
TString LRtopbranch="LRtop_N3MC_M2_sigma_true_0";
//TString LRbotcutbranch="simplebottest";
//TString LRtopbranch="simpletoptest";

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
datatree->SetBranchAddress("target",&target);
datatree->SetBranchAddress("chisq", &chisq);
datatree->SetBranchAddress("valid", &valid);
databack->SetBranchAddress("topbot",&topbot);
datatree->SetBranchAddress("topbot", &topbot);
mcTree->SetBranchAddress("matrix2", &matrix1);
mixedTree->SetBranchAddress("matrix2", &matrix1);
mcTree->SetBranchAddress("mass", &mass);
mixedTree->SetBranchAddress("mass", &mass);
mcTree->SetBranchAddress("xT", &xT);
mcTree->SetBranchAddress("weight", &weight);

//2d histograms
TH2F *h2 = new TH2F("h2","Left vs Right responses Real Data",20,-1,1,20,-1,1);
TH2F *h2mc = new TH2F("h2mc","Left vs Right responses Monte Carlo",20,-1,1,20,-1,1);
TH2F *h2mix = new TH2F("h2mix","Left vs Right responses Mixed MC NIM3",20,-1,1,20,-1,1);
TH2F *h2mcmassresp = new TH2F("h2mcmassresp","Mass vs Response in MC",20,-.3,.4,20,2,10);
//Actual histograms
TH1F *hvalid = new TH1F("hvalid","Right Valid Responses",20,LRtopcut,.4);
TH1F *htarget = new TH1F("htarget","Right Target Responses",20,LRtopcut,.4);
TH1F *hmass = new TH1F("hmass","High Mass Responses",20,LRtopcut,.4);
TH1F *hchi = new TH1F("hchi","Chi Sq Cuts",20,LRtopcut,.4);
TH1F *hj = new TH1F("hj","JPsi, Psi' Candidate Responses",20,LRtopcut,.4);
TH1F *hlvalid = new TH1F("hlvalid","Right Valid Responses",30,-.6,.4);
TH1F *hltarget = new TH1F("hltarget","Right Target Responses",30,-.6,.4);
TH1F *hlmass = new TH1F("hlmass","High Mass Responses",30,-.6,.4);
TH1F *hlj = new TH1F("hlj","JPsi, Psi' Candidate Responses",30,-.6,.4);
TH1F *hlchi = new TH1F("hlchi","Left Chi Sq Cuts",30,-.6,.4);
TH1F* hback= new TH1F("hback", "Real Data Responses", 40, -1, 1);
TH1F* hnorm= new TH1F("hnorm", "Real Data Responses", 40, -1, 1);
TH1F* hnorm2= new TH1F("hnorm2", "Real Data Responses", 40, -1, 1);
TH1F *hall = new TH1F("hvall","Right All Responses",100,-1,.4);
TH2F *hgeom = new TH2F("hgeom", "Hits Hodoscope 4 ",17,-16, 16,17,-16,16 );
TH2F *hgeomcut = new TH2F("hgeomcut", "Hits Hodoscope 2",17,-16, 16,17,-16,16 );
TH2F *hremain = new TH2F("hremain", "Hits Hodoscope 2",17,-16, 16,17,-16,16 );
//MC histograms
TH1F *hmxmass= new TH1F("hmxmass" ,"LRtop Mass Removed",30,-.6,.4);
TH1F *hmxmat= new TH1F("hmxmat","Mixed LRtop Mat1 Resp",30,-.6,.4);
//TH1F *hmxmass= new TH1F("hmxmass" ,"Mixed LRtop High xT No Mat1 Resp",30,-.6,.4);
//TH1F *hmxmat= new TH1F("hmxmat","Mixed LRtop No Mat1 Resp",30,-.6,.4);
TH1F *hmixr= new TH1F("hmixr","Mixed LRtop Resp",30,-.6,.4);
TH1F *hmcmass= new TH1F("hmcmass" ,"MC LRtop High Mass Mat1 Resp",30,-.6,.4);
TH1F *hmcmat= new TH1F("hmcmat","MC LRtop Mat1 Resp",30,-.6,.4);
TH1F *hmcnomass= new TH1F("hmcnomass" ,"MC LRtop High xT No Mat1 Resp",30,-.6,.4);
TH1F *hmcnomat= new TH1F("hmcnomat","MC LRtop No Mat1 Resp",30,-.6,.4);
TH1F *hmcr= new TH1F("hmcr","MC LRtop Resp",30,-.6,.4);
TH2F *hgeommc = new TH2F("hgeommc", "MC Hits Hodoscope",17,-16, 16,17,-16,16 );
TH2F *hgeomcutmc = new TH2F("hgeomcutmc", "MC Hits Hodoscope Cut",17,-16, 16,17,-16,16 );
TH1F *hmcxTlall= new TH1F("hmcxTlall","Left xT responses",30,-.6,.4);
TH1F *hmcxTrall= new TH1F("hmcxTrall","Right xT responses",30,-.6,.4);
TH2F *h2mcxTmat1= new TH2F("h2mcxTmat1","Left vs Right responses MC mat1",20,-1,1,20,-1,1);
TH2F *h2mcxTnomat1= new TH2F("h2mcxTmat1","Left vs Right responses MC no mat1",20,-1,1,20,-1,1);	
int rofl=0;

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
for(int i=1; i<17; i++){
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
	sprintf(tname,"h4tu%i",i);
	sprintf(tname2,"h4tu%i/I",i);
	sprintf(bname,"h4bu%i",i);
	sprintf(bname2,"h4bu%i/I",i);
	sprintf(lname,"h4Y2L%i",i);
	sprintf(lname2,"h4Y2L%i/I",i);
	sprintf(rname,"h4Y2R%i",i);
	sprintf(rname2,"h4Y2R%i/I",i);
	arg1.Form(tname);			arg2.Form(tname2);			arg3.Form(bname);			arg4.Form(bname2);
	arg5.Form(lname);			arg6.Form(lname2);			arg7.Form(rname);			arg8.Form(rname2);
	datatree->SetBranchAddress(arg1 ,&h4t[i]);
	datatree->SetBranchAddress(arg3 ,&h4b[i]);
	if(i<16) datatree->SetBranchAddress(arg5 ,&h4l[i]);
	if(i<16) datatree->SetBranchAddress(arg7 ,&h4r[i]);
	databack->SetBranchAddress(arg1 ,&h4t[i]);
	databack->SetBranchAddress(arg3 ,&h4b[i]);
	if(i<16) databack->SetBranchAddress(arg5 ,&h4l[i]);
	if(i<16) databack->SetBranchAddress(arg7 ,&h4r[i]);
	if(i<16) mcTree->SetBranchAddress(arg5 ,&h4l[i]);
	if(i<16) mcTree->SetBranchAddress(arg7 ,&h4r[i]);
} 
//This goes back through different cut evaluators
//Background Graphing Loop
for(int i=0; i< databack->GetEntries(); i++){
	databack->GetEntry(i);
	if(topbot<0) rofl++;
	if(((BDT_L>LRtopcut)&&(topbot>0))||((BDT_R>LRbotcut)&&(topbot<0)))	 accepted++;
	hback->Fill(BDT_R);
	for(int k=0; k<46 ; k++){
		hall->Fill(BDT_R);	
	}
	for(int x=1;x<17;x++){
		for(int y=1;y<17;y++){
			if((h2t[x]>0)&&(h2r[y]>0)){hgeom->Fill(x,y); if(((BDT_L>LRtopcut)&&(topbot>0))||((BDT_R>LRbotcut)&&(topbot<0))) hgeomcut->Fill(x,y);}
			if((h2t[x]>0)&&(h2l[y]>0)){hgeom->Fill(x,(y-17)); if(((BDT_L>LRtopcut)&&(topbot>0))||((BDT_R>LRbotcut)&&(topbot<0))) hgeomcut->Fill(x,(y-17));}
			if((h2b[x]>0)&&(h2r[y]>0)){hgeom->Fill((x-17),y); if(((BDT_L>LRtopcut)&&(topbot>0))||((BDT_R>LRbotcut)&&(topbot<0)))hgeomcut->Fill((x-17),y);}
			if((h2b[x]>0)&&(h2l[y]>0)){hgeom->Fill((x-17),(y-17)); if(((BDT_L>LRtopcut)&&(topbot>0))||((BDT_R>LRbotcut)&&(topbot<0))) hgeomcut->Fill((x-17),(y-17));}
		}
	}
 	/*for(int x=1;x<17;x++){
		for(int y=1;y<17;y++){
			if((h4t[x]>0)&&(h4r[y]>0)){hgeommc->Fill(x,y); if(((BDT_L>LRtopcut)&&(topbot>0))&&((BDT_R>LRbotcut)&&(topbot<0))) hgeomcutmc->Fill(x,y);}
			if((h4t[x]>0)&&(h4l[y]>0)){hgeommc->Fill(x,(y-17)); if(((BDT_L>LRtopcut)&&(topbot>0))&&((BDT_R>LRbotcut)&&(topbot<0))) hgeomcutmc->Fill(x,(y-17));}
			if((h4b[x]>0)&&(h4r[y]>0)){hgeommc->Fill((x-17),y); if(((BDT_L>LRtopcut)&&(topbot>0))&&((BDT_R>LRbotcut)&&(topbot<0)))hgeomcutmc->Fill((x-17),y);}
			if((h4b[x]>0)&&(h4l[y]>0)){hgeommc->Fill((x-17),(y-17)); if(((BDT_L>LRtopcut)&&(topbot>0))&&((BDT_R>LRbotcut)&&(topbot<0))) hgeomcutmc->Fill((x-17),(y-17));}
		}
	}*/
}
//signal Loop?
for(int i=0; i<mixedTree->GetEntries();i++){
	mixedTree->GetEntry(i);
	h2mix->Fill(BDT_L, BDT_R);
	hmixr->Fill(BDT_L);
	mixtot++;
	if(((BDT_L>LRtopcut)&&(topbot>0))||((BDT_R>LRbotcut)&&(topbot<0))){ mixacp++;}
	if(matrix1>0){ 
		mixmattot++;
		if(((BDT_L>LRtopcut)&&(topbot>0))||((BDT_R>LRbotcut)&&(topbot<0))) mixmatacp++; 
//		hmxmat->Fill(BDT_L);
		if(mass>4.4){ 
			mixhightot++;
//			hmxmass->Fill(BDT_L);
			if(((BDT_L>LRtopcut)&&(topbot>0))||((BDT_R>LRbotcut)&&(topbot<0))) mixhighpass++;
		}
	}
	if(matrix1==0){
		if(((BDT_L>LRtopcut)&&(topbot>0))||((BDT_R>LRbotcut)&&(topbot<0))){
			mixadded++;
			if(mass>4.4) 	mixaddedmass++;
		}
	}

}
for(int i=0; i< datatree->GetEntries(); i++){
	datatree->GetEntry(i);
	h2->Fill(BDT_L, BDT_R);
	hnorm->Fill(BDT_R);
	hall->Fill(BDT_R);
	if(((BDT_L>LRtopcut)&&(topbot>0))&&((BDT_R>LRbotcut)&&(topbot<0))){	signaled++; }
	if(valid>0){ hvalid->Fill(BDT_R); hlvalid->Fill(BDT_L); }
	if((target>0)&&(valid>0)){  htarget->Fill(BDT_R); hltarget->Fill(BDT_L); plaus++; }
	if((mass<3.7)&&(mass>3.0)){ hj->Fill(BDT_R); hlj->Fill(BDT_L); }
	if((mass>3.8)&&(valid>0)&&(target>0)){ hmass->Fill(BDT_R); hlmass->Fill(BDT_L); }
	if((valid>0)&&(target>0)&&(chisq<80)) { 
		if((((BDT_L>LRtopcut)&&(topbot>0)))||(((BDT_R>LRbotcut)&&(topbot<0)))){ plauspass++; hnorm->Fill(BDT_R);	hchi->Fill(BDT_R); hlchi->Fill(BDT_L); hnorm2->Fill(BDT_R); }
	}


	mcTree->GetEntry(i);
	h2mc->Fill(BDT_L, BDT_R);
	hmcr->Fill(BDT_R);
	h2mcmassresp->Fill(BDT_R, mass);
	mctot++;
	if(((BDT_L>LRtopcut)&&(topbot>0))||((BDT_R>LRbotcut)&&(topbot<0))) mcacp++;
	if(matrix1>0){ 
		mcmattot++;
		if(((BDT_L>LRtopcut)&&(topbot>0))||((BDT_R>LRbotcut)&&(topbot<0))) mcmatacp++;
		hmcmat->Fill(BDT_L);
		if(mass>4.4){ 
			mchightot++;
			hmcmass->Fill(BDT_L);
			if(((BDT_L>LRtopcut)&&(topbot>0))||((BDT_R>LRbotcut)&&(topbot<0))) mchighpass++;
			else hmxmass->Fill(BDT_R);
			if(xT>.3){
				mcxThighall++;
				if(((BDT_L>LRtopcut)&&(topbot>0))||((BDT_R>LRbotcut)&&(topbot<0))) mcxThighpass++;
			}
		}
		if(xT> .3){
			mcxTall++;
			hmcxTlall->Fill(BDT_L);
			hmcxTrall->Fill(BDT_R);
			if(((BDT_L>LRtopcut)&&(topbot>0))||((BDT_R>LRbotcut)&&(topbot<0))) mcxTpass++;
			if(matrix1<1){ mcxTnomat1++; }
			if(matrix1>0) mcxTmat1++;
			wmcxTall+=  1/weight;
			if(((BDT_L>LRtopcut)&&(topbot>0))||((BDT_R>LRbotcut)&&(topbot<0))) wmcxTpass+=weight;
			if(matrix1<1) wmcxTnomat1+=weight;
			if(matrix1>0) wmcxTmat1+=weight;{	h2mcxTmat1->Fill(BDT_L, BDT_R);}
			if((matrix1>0)&&((BDT_L>LRtopcut)&&(topbot>0))||(BDT_R>LRbotcut)&&(topbot<0))){
				mcxTmat1pass++;
				wmcxTmat1pass+= weight;

			}
			if((matrix1<1)&&((BDT_L>LRtopcut)&&(topbot>0))||((BDT_R>LRbotcut)&&(topbot<0))){
				mcxTnomat1pass++;	
				wmcxTnomat1pass+=weight;	
				h2mcxTnomat1->Fill(BDT_L, BDT_R);			
			}
		}
	}
	
/*	for(int x=1;x<17;x++){
		for(int y=1;y<17;y++){
			if((h2t[x]>0)&&(h2r[y]>0)){hgeommc->Fill(x,y); if(((BDT_L>LRtopcut)&&(topbot>0))&&((BDT_R>LRbotcut)&&(topbot<0))) hgeomcutmc->Fill(x,y);}
			if((h2t[x]>0)&&(h2l[y]>0)){hgeommc->Fill(x,(y-17)); if(((BDT_L>LRtopcut)&&(topbot>0))&&((BDT_R>LRbotcut)&&(topbot<0))) hgeomcutmc->Fill(x,(y-17));}
			if((h2b[x]>0)&&(h2r[y]>0)){hgeommc->Fill((x-17),y); if(((BDT_L>LRtopcut)&&(topbot>0))&&((BDT_R>LRbotcut)&&(topbot<0)))hgeomcutmc->Fill((x-17),y);}
			if((h2b[x]>0)&&(h2l[y]>0)){hgeommc->Fill((x-17),(y-17)); if(((BDT_L>LRtopcut)&&(topbot>0))&&((BDT_R>LRbotcut)&&(topbot<0))) hgeomcutmc->Fill((x-17),(y-17));}
		}
	}*/
 /*	for(int x=1;x<17;x++){
		for(int y=1;y<17;y++){
			if((h4t[x]>0)&&(h4r[y]>0)){hgeommc->Fill(x,y); if(((BDT_L>LRtopcut)&&(topbot>0))&&((BDT_R>LRbotcut)&&(topbot<0))) hgeomcutmc->Fill(x,y);}
			if((h4t[x]>0)&&(h4l[y]>0)){hgeommc->Fill(x,(y-17)); if(((BDT_L>LRtopcut)&&(topbot>0))&&((BDT_R>LRbotcut)&&(topbot<0))) hgeomcutmc->Fill(x,(y-17));}
			if((h4b[x]>0)&&(h4r[y]>0)){hgeommc->Fill((x-17),y); if(((BDT_L>LRtopcut)&&(topbot>0))&&((BDT_R>LRbotcut)&&(topbot<0)))hgeomcutmc->Fill((x-17),y);}
			if((h4b[x]>0)&&(h4l[y]>0)){hgeommc->Fill((x-17),(y-17)); if(((BDT_L>LRtopcut)&&(topbot>0))&&((BDT_R>LRbotcut)&&(topbot<0))) hgeomcutmc->Fill((x-17),(y-17));}
		}
	}*/
}
//((mass>3.7)&&(dimuon>0)&&(target>0)&&(chisq<70))
h2->Draw("COLZ");
c1->SaveAs("crosscorrelation.png");
hvalid->Draw();
c1->SaveAs("validrightresp.png");
htarget->Draw();
//htarget->SetFillColor(kRed);
//c1->Update();
c1->SaveAs("targetrightresp.png");
hj->Draw();
c1->SaveAs("jmassrangeright.png");
hmass->Draw();
c1->SaveAs("highmassright.png");
hlvalid->Draw();
c1->SaveAs("validleftresp.png");
hltarget->Draw();
c1->SaveAs("targetleftresp.png");
hlj->Draw();
c1->SaveAs("jmassrangerleft.png");
hlmass->Draw();
c1->SaveAs("highmassleft.png");
hchi->Draw();
c1->SaveAs("chicutsright.png");
hlchi->Draw();
c1->SaveAs("chicutsleft.png");
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
hgeom->Draw("COLZ");
c1->SaveAs("MChodohits.png");
hgeomcut->Draw("COLZ");
c1->SaveAs("MChodohitcut.png"); 
h2mc->Draw("COLZ");
c1->SaveAs("MixResponseCompare.png");
h2mix->Draw("COLZ");
c1->SaveAs("Mixresponsecompare.png");
h2mcmassresp->Draw("COLZ");
c1->SaveAs("mcmassresponse.png");
h2mcxTmat1->Draw("COLZ");
c1->SaveAs("mcmat1xTresp.png");
h2mcxTnomat1->Draw("COLZ");
c1->SaveAs("mcnomat1xTresp.png");
hmcxTlall->Draw("COLZ");
c1->SaveAs("mcxTLresp.png");
hmcxTrall->Draw("COLZ");
c1->SaveAs("mcxTRresp.png");

//report statistics section, creates some and couts others
float bfraction=accepted-rofl;
bfraction=bfraction/(rofl);
cout<<"Non-Dimuon Fraction Passed"<<bfraction<<endl;
float sfraction=signaled;
sfraction=sfraction/(datatree->GetEntries());
float totalreject=sfraction*2700+bfraction* 92700;
totalreject=(1-totalreject/(2700+92700));
cout<<"Dimuon Fraction Passed"<<sfraction<<endl;
float plausfraction=plauspass;
if(plaus>0) plausfraction=plauspass/plaus;
cout<<"plaus fraction"<<plausfraction<<endl;
cout<<"plaus total"<<plaus<<endl;
cout<<"Approximate Rejection Rate"<<totalreject<<endl;

float mixacpf=mixacp;
if(mixtot>0) mixacpf=mixacpf/((float) mixtot);
cout<<"Mixed Passed:"<<mixacpf<<endl;
float mixmatacpf= mixmatacp;
if(mixmattot>0) mixmatacpf=mixmatacpf/mixmattot;
cout<<"Mixed Passed (mat1):"<<mixmatacpf<<endl;
float mixhighpassf=mixhighpass;
if(mixhightot>0) mixhighpassf=mixhighpassf/((float) mixhightot);
cout<<"Mixed High Pass (mat1):"<<mixhighpassf<<endl;

float mcacpf=mcacp;
if(mcacpf>0) mcacpf=mcacpf/mctot;
cout<<"MC Passed:"<<mcacpf<<endl;
float mcmatacpf= mcmatacp;
if(mcmattot>0)mcmatacpf=mcmatacpf/mcmattot;
cout<<"MC Passed (mat1):"<<mcmatacpf<<endl;
float mchighpassf=mchighpass;
if(mchightot>0) mchighpassf=mchighpassf/((float) mchightot);
cout<<"MC High Pass (mat1):"<<mchighpassf<<endl;
float addedpercent= mixadded;
if(mixmattot>0) addedpercent=addedpercent/(mixmattot);
cout<<"Possible Mix Added: "<<addedpercent <<endl;
float addedpercenthigh= mixaddedmass;
if( mixmattot>0)addedpercenthigh=addedpercenthigh/(mixmattot);
cout<<"Possible Mix Added: "<<addedpercenthigh <<endl;



cout<<"New Info"<<endl;
float totalratio=  mcxTmat1;
if(mcxTnomat1<0) totalratio=mcxTmat1/mcxTnomat1;
cout<<"Weighted Ratio: "<<totalratio<<endl;
float wtotalratio=  wmcxTmat1;
if(wmcxTnomat1>0) wtotalratio=wmcxTmat1/wmcxTnomat1;
cout<<"Ratio: "<<wtotalratio<<endl;
float xTratio=mcxTpass;
if(mcxTall>0) xTratio=xTratio/mcxTall;
cout<<"Weighted Ratio high xT:"<<xTratio <<endl;
float mcxTmat1ratio=mcxTmat1pass;
if(mcxTmat1>0) mcxTmat1ratio=mcxTmat1ratio/(mcxTmat1);
cout<<"MC high xT mat1 pass:"<<mcxTmat1ratio<<endl;
float mcxTnomat1ratio=mcxTnomat1pass;
mcxTnomat1ratio=mcxTnomat1ratio/(mcxTnomat1);
cout<<"MC high xT no mat1 pass:"<<mcxTnomat1ratio<<endl;
float wxTratio=wmcxTpass;
wxTratio=wxTratio/wmcxTall;
cout<<"Unweighted Ratio high xT:"<<wxTratio <<endl;
float wmcxTmat1ratio=wmcxTmat1pass;
wmcxTmat1ratio=wmcxTmat1ratio/(wmcxTmat1);
cout<<"MC high xT mat1 pass:"<<wmcxTmat1ratio<<endl;
float wmcxTnomat1ratio=wmcxTnomat1pass;
wmcxTnomat1ratio=wmcxTnomat1ratio/(wmcxTnomat1);
cout<<"MC high xT no mat1 pass:"<<wmcxTnomat1ratio<<endl;

float improve=mcxTnomat1pass;
improve=improve/mcxTmat1;
float wimprove=wmcxTnomat1pass/wmcxTmat1;
cout<<"Weighted Improvement "<< improve<<endl;
cout<<"Unweighted Improvement "<<wimprove<<endl;

//97.4
}

//83.4 low 
