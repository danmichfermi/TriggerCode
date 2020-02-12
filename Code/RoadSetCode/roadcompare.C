void roadcompare(){
TFile *data= new TFile("BDTMATRIX1v3.root","READ");
//TTree *//signal = (TTree *) data->Get("//signal");
//TTree *//background = (TTree *) data->Get("//background");
TFile* myroads = new TFile("roadsetbot.root","update");
TTree* myroadtree = (TTree*)(myroads->Get("secondcut6"));
TFile* road57 = new TFile("currentroadsets.root","READ");
TTree *roadcurrenttree = (TTree*)(road57->Get("76_bot"));
int pass;
int normroadid;
int myroadid;
//roadcurrenttree->SetBranchAddress("roadid",&normroadid);
myroadtree->SetBranchAddress("roadid",&myroadid);
TBranch *derp=myroadtree->Branch("CurrentRoad",&pass,"CurrentRoad/I");
int stotal=0;
int temporaryconst=roadcurrenttree->GetEntries();
const int number=temporaryconst;
int roads[number];
const int H1MAX=24;  // plus one to avoid shifting indi1ces later
const int H2MAX=17;
const int H3MAX=17;
const int H4MAX=17;
float h1b[H1MAX];
float  h2b[H2MAX];
float h3b[H3MAX];
float h4bu[H4MAX];
float h4bd[H4MAX];
float ch1b[H1MAX];
float ch2b[H2MAX];
float ch3b[H3MAX];
float ch4bu[H4MAX];
float ch4bd[H4MAX];
float matpurity;
float BDT_response;
float BDT_response_2;
float nimpurity;
int totalroad;
float mass;

myroadtree->SetBranchAddress("nimpurity",&nimpurity);
myroadtree->SetBranchAddress("mat4purity",&matpurity);
myroadtree->SetBranchAddress("BDT_N3",&BDT_response);
myroadtree->SetBranchAddress("BDT_M4",&BDT_response_2);
myroadtree->SetBranchAddress("mass", &mass);
myroadtree->SetBranchAddress("num", &totalroad);

for(int i=0; i<number ; i++){
    roads[i]=0;
}
for(int i=1; i<24 ; i++){
        char* tname[10];
        char* tname2[10];
        char* bname[10];
        char* bname2[10];
        TString arg1;         TString arg3;         TString arg3;         TString arg4;
        sprintf(tname,"h1t%i",i);
        sprintf(tname2,"h1t%i",i);
        sprintf(bname,"h1b%i",i);
        sprintf(bname2,"h1b%i/F",i);
        //arg1.Form(tname);            arg3.Form(tname2);
        arg3.Form(bname);            arg4.Form(bname2);
        //signal->SetBranchAddress(arg3, &h1b[i]);
        //background->SetBranchAddress(arg3, &h1b[i]);
        roadcurrenttree->SetBranchAddress(arg3, &ch1b[i]);
        myroadtree->SetBranchAddress(arg3, &h1b[i]);
}
for(int i=1; i<17 ; i++){
        char* tname[10];
        char* tname2[10];
        char* bname[10];
        char* bname2[10];
        TString arg1;         TString arg3;         TString arg3;         TString arg4;
        sprintf(tname,"h2t%i",i);
        sprintf(tname2,"h2t%i",i);
        sprintf(bname,"h2b%i",i);
        sprintf(bname2,"h2b%i/F",i);
        //arg1.Form(tname);            arg3.Form(tname2);
         arg3.Form(bname);            arg4.Form(bname2);
        //signal->SetBranchAddress(arg3, &h2b[i]);
        //background->SetBranchAddress(arg3, &h2b[i]);
        roadcurrenttree->SetBranchAddress(arg3, &ch2b[i]);
        myroadtree->SetBranchAddress(arg3, &h2b[i]);
}
for(int i=1; i<17 ; i++){
        char* tname[10];
        char* tname2[10];
        char* bname[10];
        char* bname2[10];
        TString arg1;         TString arg3;         TString arg3;         TString arg4;
        sprintf(tname,"h3t%i",i);
        sprintf(tname2,"h3t%i",i);
        sprintf(bname,"h3b%i",i);
        sprintf(bname2,"h3b%i/F",i);
        //arg1.Form(tname);        arg3.Form(tname2);
            arg3.Form(bname);            arg4.Form(bname2);
        roadcurrenttree->SetBranchAddress(arg3, &ch3b[i]);
        myroadtree->SetBranchAddress(arg3, &h3b[i]);
}
for(int i=1; i<17 ; i++){
        char* tname[10];
        char* tname2[10];
        char* bname[10];
        char* bname2[10];
        TString arg1;         TString arg3;         TString arg3;         TString arg4;
        sprintf(tname,"h4tu%i",i);
        sprintf(tname2,"h4tu%i",i);
        sprintf(bname,"h4bu%i",i);
        sprintf(bname2,"h4bu%i/F",i);
        //arg1.Form(tname);            arg3.Form(tname2);
            arg3.Form(bname);            arg4.Form(bname2);
        //signal->SetBranchAddress(arg3, &h4bu[i]);
        //background->SetBranchAddress(arg3, &h4bu[i]);
        roadcurrenttree->SetBranchAddress(arg3, &ch4bu[i]);
        myroadtree->SetBranchAddress(arg3, &h4bu[i]);
}
/*for(int i=1; i<17 ; i++){
        char* tname[10];
        char* tname2[10];
        char* bname[10];
        char* bname2[10];
        TString arg1;         TString arg3;         TString arg3;         TString arg4;
        sprintf(tname,"h4td%i",i);
        sprintf(tname2,"h4td%i",i);
        sprintf(bname,"h4bd%i",i);
        sprintf(bname2,"h4bd%i/F",i);
        //arg1.Form(tname);            arg3.Form(tname2);            arg3.Form(bname);            arg4.Form(bname2);
        //signal->SetBranchAddress(arg3, &h4bd[i]);
        //background->SetBranchAddress(arg3, &h4bd[i]);
        roadcurrenttree->SetBranchAddress(arg3, &ch4bd[i]);
        myroadtree->SetBranchAddress(arg3, &h4bd[i]);
}*/
ofstream outfile ("myroadss.txt");
ofstream outfile2 ("roadsmissing.txt");

for(int i=0; i< myroadtree->GetEntries() ; i++){
    pass=0;
    bool triggered=false;
    myroadtree->GetEntry(i);
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
            if(h4bu[j]>0){
                if(ch4bu[j]>0) { correct=true; check[0]++;}
                fourth.push_back(j);
            }
        }  
        if(!(correct)){
            if(x>0) continue;
            looping=false;
        }
        correct=false;
        for(int j=1; j<17 ; j++){
            if(h3b[j]>0){
                if(ch3b[j]>0){ correct=true; check[1]++; }
                third.push_back(j);
            }
        }  
        if(!(correct)){
            if(x>0) continue;
            looping=false;
        }
        correct=false;
        for(int j=1; j<17 ; j++){
            if(h2b[j]>0){
                if(ch2b[j]>0) { correct=true; check[2]++; }
                second.push_back(j);
            }
        }  
        if(!(correct)){
            if(x>0) continue;
            looping=false;
        }
        correct=false;
        for(int j=1; j< 24; j++){
            if(h1b[j]>0){
                if(ch1b[j]>0) { correct=true; check[3]++; }
                first.push_back(j);
            }
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

    }
    if(!(triggered)&&(totalroad>-1)&&(nimpurity>.5)){ outfile<<myroadid;
    outfile<<"\t"<<first[0]<<"\t"<<second[0]<<"\t"; outfile<<third[0]<<"\t"<<fourth[0];
outfile<<"\t"<<nimpurity<<"\t"<<matpurity<<"\t"<<BDT_response<<"\t"<<BDT_response_2<<"\t"<<mass<<"\t"<<totalroad<<endl;  }
    derp->Fill();
}
for(int z=0; z<number; z++){
    if(roads[z]>0){
        currentroadset->GetEntry(z);
        outfile2<<normroadid<<endl;
    }
}
cout<<stotal<<endl;
//outfile->Close();
//outfile2->Close();
myroads->cd();
myroadtree->Write("", TObject::kOverwrite);
}

