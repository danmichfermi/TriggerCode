void broadextraction(){
//    TString="";                //choose tree set to cut on
//    float cut=;                     //choose value to cut on
    bool treed=true;                //do you want a new tree yes or no?
    int lol= 2*(23+16+16+16+16);
    const int n= lol;
    float var[n];
    float dvar[n];
    float BDT_response;
    float BDT_response_2;
    int roadid;
    float mass;
    float signorm;
    float backnorm;
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
    int sigtotal;
    TFile* f= new TFile("roadsetbot.root","update");
    TTree* roadset=(TTree*)(f->Get("firstcut6"));
//    TTree* roadset = (TTree*)(f->Get("firstcut_6"));
    TTree* b1= new TTree("secondcut6","firstremoval");
//    TTree* b1=new TTree("firstcut1","purity removal");
//    TTree* t1= new TTree("firstcut_6","firstremoval");
    roadset->SetBranchAddress("backnorm",&backnorm);
    roadset->SetBranchAddress("signalnorm",&signorm);
    roadset->SetBranchAddress("dumpdynorm",&dumpdynorm);
    roadset->SetBranchAddress("tjpsinorm",&tjpsinorm);
     roadset->SetBranchAddress("djpsinorm",&djpsinorm);
   roadset->SetBranchAddress("tpsipnorm",&tpsipnorm);
    roadset->SetBranchAddress("dpsipnorm",&dpsipnorm);
    roadset->SetBranchAddress("nimpurity",&nimpurity);
    roadset->SetBranchAddress("dumpdypurity",&dumpdypurity);
    roadset->SetBranchAddress("tjpsipurity",&tjpsipurity);
    roadset->SetBranchAddress("djpsipurity",&djpsipurity);
    roadset->SetBranchAddress("tpsippurity",&tpsippurity);
    roadset->SetBranchAddress("dpsippurity",&dpsippurity);
    roadset->SetBranchAddress("mat4purity",&matpurity);
    roadset->SetBranchAddress("BDT_N3", &BDT_response);
    roadset->SetBranchAddress("BDT_M4", &BDT_response_2);
//    roadset->SetBranchAddress("BDT_MAT4", &BDT_response);
//    roadset->SetBranchAddress("BDT_NIM3cross_dy", &BDT_response_2);
//    roadset->SetBranchAddress("mat4_2",&BDT_response);
//    roadset->SetBranchAddress("nim3_again",&BDT_response_2);
//    roadset->SetBranchAddress("particleid", &particleid);
    roadset->SetBranchAddress("mass", &mass);
    roadset->SetBranchAddress("num", &sigtotal);
    b1->Branch("mass",&mass,"mass/F");
    b1->Branch("num", &sigtotal,"num/I");
    b1->Branch("BDT_N3",&BDT_response,"BDT_N3/F");
    b1->Branch("BDT_M4",&BDT_response_2,"BDT_M4/F");
    b1->Branch("roadid",&roadid,"roadid/I"); 
   b1->Branch("backnorm",&backnorm,"backnorm/F");
    b1->Branch("signalnorm",&signorm,"signalnorm/F");
    b1->Branch("dumpdynorm",&dumpdynorm,"dumpdynorm/F");
    b1->Branch("tjpsinorm",&tjpsinorm,"tjpsinorm/F");
     b1->Branch("djpsinorm",&djpsinorm,"djpsinorm/F");
    b1->Branch("tpsipnorm",&tpsipnorm,"tpsipnorm/F");
    b1->Branch("dpsipnorm",&dpsipnorm,"dpsipnorm/F");
    b1->Branch("nimpurity",&nimpurity,"nimpurity/F");
    b1->Branch("dumpdypurity",&dumpdypurity,"dumpdypurity/F");
    b1->Branch("tjpsipurity",&tjpsipurity,"tjpsipurity/F");
    b1->Branch("djpsipurity",&djpsipurity,"djpsipurity/F");
    b1->Branch("tpsippurity",&tpsippurity,"tpsippurity/F");
    b1->Branch("dpsippurity",&dpsippurity,"dpsippurity/F");
    b1->Branch("mat4purity",&matpurity,"mat4purity/F");
//    t1->Branch("particleid",&particleid,"particleid/I");
for(int i=1; i<24 ; i++){
        char* tname[10];
        char* tname2[10];
        char* bname[10];
        char* bname2[10];
        TString arg1;         TString arg2;         TString arg3;         TString arg4;
        sprintf(tname,"h1t%i",i);
        sprintf(tname2,"h1t%i/F",i);
        sprintf(bname,"h1b%i",i);
        sprintf(bname2,"h1b%i/F",i);
//        arg1.Form(tname);            arg2.Form(tname2);
            arg3.Form(bname);            arg4.Form(bname2);
//        cout<<entry<<endl;
//        entry++;
//    cout<<arg1<<endl;
//        cout<<entry<<endl;
//        entry++;
//    cout<<arg3<<endl;
//        t3->Branch(arg1 ,&hf1t[i],arg2);
//t1->Branch(arg3 ,&dvar[24-1+i],arg4);
        //->AddVariable(arg1,&var[i-1]);
        b1->Branch(arg3 ,&dvar[i-1], arg4);
        roadset->SetBranchAddress(arg3, &dvar[i-1]);
//        //->AddVariable(arg3,&var[24-1+i]);\
      
//    roadset->SetBranchAddress(arg3, &dvar[24-1+i]);
}
for(int i=1; i<17 ; i++){
        char* tname[10];
        char* tname2[10];
        char* bname[10];
        char* bname2[10];
        TString arg1;         TString arg2;         TString arg3;         TString arg4;
        sprintf(tname,"h2t%i",i);
        sprintf(tname2,"h2t%i/F",i);
        sprintf(bname,"h2b%i",i);
        sprintf(bname2,"h2b%i/F",i);
//        arg1.Form(tname);            arg2.Form(tname2);
            arg3.Form(bname);            arg4.Form(bname2);
        b1->Branch(arg3 ,&dvar[24+24-1+i], arg4);
//t1->Branch(arg3 ,&dvar[24+24+17-1+i],arg4);
    //->AddVariable(arg1,&var[24+24-1+i]);
//    //->AddVariable(arg3,&var[24+24+17-1+i]);
        roadset->SetBranchAddress(arg3, &dvar[24+24-1+i]);
//    roadset->SetBranchAddress(arg3, &dvar[24+24+17-1+i]);
}
for(int i=1; i<17 ; i++){
        char* tname[10];
        char* tname2[10];
        char* bname[10];
        char* bname2[10];
        TString arg1;         TString arg2;         TString arg3;         TString arg4;
        sprintf(tname,"h3t%i",i);
        sprintf(tname2,"h3t%i/F",i);
        sprintf(bname,"h3b%i",i);
        sprintf(bname2,"h3b%i/F",i);
//        arg1.Form(tname);            arg2.Form(tname2);    
        arg3.Form(bname);            arg4.Form(bname2);
        b1->Branch(arg3 ,&dvar[24+24+17-1+i+17],arg4);
//        t3->Branch(arg1 ,&hf3t[i],arg2);
//t1->Branch(arg3 ,&dvar[24+24+17-1+i+17+17],arg4);
    //->AddVariable(arg1,&var[24+24+17-1+i+17]);
//    //->AddVariable(arg3,&var[24+24+17-1+i+17+17]);
        roadset->SetBranchAddress(arg3, &dvar[24+24+17-1+i+17]);
//    roadset->SetBranchAddress(arg3, &dvar[24+24+17-1+i+17+17]);
}
for(int i=1; i<17 ; i++){
        char* tname[10];
        char* tname2[10];
        char* bname[10];
        char* bname2[10];
        TString arg1;         TString arg2;         TString arg3;         TString arg4;
        sprintf(tname,"h4tu%i",i);
        sprintf(tname2,"h4tu%i/F",i);
        sprintf(bname,"h4bu%i",i);
        sprintf(bname2,"h4bu%i/F",i);
//        arg1.Form(tname);            arg2.Form(tname2);   
        arg3.Form(bname);            arg4.Form(bname2);
        b1->Branch(arg3 ,&dvar[24+24+17-1+i+17+17+17], arg4);
//t1->Branch(arg3 ,&dvar[24+24+17-1+i+17+17+16],arg4);
    //->AddVariable(arg1,&var[24+24+17-1+i+17+17+17]);
//    //->AddVariable(arg3,&var[24+24+17-1+i+17+17+16]);
        roadset->SetBranchAddress(arg3, &dvar[24+24+17-1+i+17+17+17]);
//    roadset->SetBranchAddress(arg3, &dvar[24+24+17-1+i+17+17+16]);
}
int hodo[4];
ofstream outfile("firstcutroad.dat");

for(int i=0; i<roadset->GetEntries(); i++){
    bool fillerup=true;
    roadset->GetEntry(i);
    for(int j=0; j<23; j++){
        if(dvar[j]>0) hodo[0]=j;
    }
    for(int j=0; j<17; j++){
        if(dvar[j+24+24]>0) hodo[1]=j;
    }
    for(int j=0; j<17; j++){
        if(dvar[24+24+17+j+17]>0) hodo[2]=j;
    }
    for(int j=0; j<17; j++){
        if(dvar[24+24+17+j+17+17+17]>0) hodo[3]=j;
    }
//cuts
//    fillerup=(BDT_response>=-.10); //if greater than
 //   if(BDT_response_2<-.05) fillerup=false;
    roadid=i;                                    //min purity
//    if(    (    (hodo[0]<(hodo[1])    )
//    &&(hodo[2]<(hodo[1]-1)    )    )    ||                //no zig zagging station 1-3
//    (    (hodo[0]>(hodo[1]))&&
//        (hodo[2]>(hodo[1]+1))    )    ) fillerup=false ;
    if(nimpurity<.4) fillerup=false;
    if(matpurity<.3) fillerup=false;
 //   if(sigtotal<2) fillerup=false;
    if(fillerup){
        b1->Fill();
        for(int k=0; k<4; k++){
            outfile<< hodo[k]<<"\t";
        }
        outfile<<BDT_response<<endl;
    }
}
  
outfile.close();
b1->Write();
cout<<b1->GetEntries()<<endl;
}    
