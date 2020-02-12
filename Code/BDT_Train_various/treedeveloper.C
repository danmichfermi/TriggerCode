#include "treed.C"
//needs to be run before tree mixer

void treedeveloper(){
	const int tablenum=8;
//create file
	TFile *f= new TFile("MonteCarloTrees.root", "RECREATE");
//list of all tables, potentially use LD2dump?
	TString table[tablenum]={"mc_drellyan_dump_M012_S012", "mc_drellyan_LD2_M012_S012", "mc_jpsi_LD2_M005_S010", "mc_jpsi_dump_M013_S001", "mc_psiprime_dump_M006_S010", "mc_psiprime_LD2_M005_S010", "run_008263_R001","test_darkphoton_mass_250mev"};
//,"run_009713_R000"};//"mc_gun_LD2_M011_S015"}; need later ones as well
//	TString table[tablenum]={"mc_psiprime_LD2_M005_S010", "mc_drellyan_LD2_M012_S012", "mc_jpsi_LD2_M005_S010", "mc_jpsi_dump_M013_S001", "mc_psiprime_dump_M006_S010", "mc_drellyan_dump_M012_S012",  "run_009773_R001"};//,"run_009713_R000"};//"mc_gun_LD2_M011_S015"};

//number of entries filled
//turn each table into a tree 
//first define trees	
	TTree * collection[tablenum];
	const int H1MAX=24;  // plus one to avoid shifting indices later
	const int H2MAX=24;
	const int H3MAX=24;
	const int H4MAX=24;

	int h1t[H1MAX];
	int h2t[H2MAX];
	int h3t[H3MAX];
	int h4tu[H4MAX];
	int h4td[H4MAX];
	int h1b[H1MAX];
	int h2b[H2MAX];
	int h3b[H3MAX];
	int h4bu[H4MAX];
	int h4bd[H4MAX];
	int h1l[H1MAX];
	int h2l[H2MAX];
	int h3l[H3MAX];
	int h4lu[H4MAX];
	int h4ld[H4MAX];
	int h4Y1Ll[H4MAX];
	int h4Y1Lr[H4MAX];
	int h4Y2Ll[H4MAX];
	int h4Y2Lr[H4MAX];
	int h4Y1Rl[H4MAX];
	int h4Y1Rr[H4MAX];
	int h4Y2Rl[H4MAX];
	int h4Y2Rr[H4MAX];
	int h1r[H1MAX];
	int h2r[H2MAX];
//int h3r[H3MAX];
//	int h4ru[H4MAX];
//	int h4rd[H4MAX];



	int eh1t[H1MAX];
	int eh2t[H2MAX];
	int eh3t[H3MAX];
	int eh4tu[H4MAX];
	int eh4td[H4MAX];
	int eh1b[H1MAX];
	int eh2b[H2MAX];
	int eh3b[H3MAX];
	int eh4bu[H4MAX];
	int eh4bd[H4MAX];
	int eh1l[H1MAX];
	int eh2l[H2MAX];
	int eh3l[H3MAX];
	int eh4lu[H4MAX];
	int eh4ld[H4MAX];
	int eh1r[H1MAX];
	int eh2r[H2MAX];
	int eh3r[H3MAX];
	int eh4ru[H4MAX];
	int eh4rd[H4MAX];


	int MATRIX1=0;
	int dimuon=0;

	
//	TCanvas* c1 = new TCanvas("c1", ""); 
	const Char_t* host = "mysql://seaquel.physics.illinois.edu:3283/";
	const Char_t* user = "user";
	const Char_t* pass = "user"; 

	float mass;

	TSQLServer* con = TSQLServer::Connect(host, user, pass); 

//	TString query[tablenum];
	for(int j=0;  j< 7; j++){
		collection[j]= new TTree(table[j], table[j]);
		TSQLResult* resm[tablenum];
		TSQLRow* row[tablenum];
		collection[j]->Branch("mass",&mass,"mass/F");
		collection[j]->Branch("matrix",&MATRIX1,"matrix/F");
		collection[j]->Branch("dimuon",&dimuon,"dimuon/I");
/*		query[j]=query;
		query[j]= query[j]+table[j].Data();
		query[j]+=category;
		res[j] = con->Query(query[j]);
		TString temp;
		temp=query;
		temp+=table[j].Data();
		temp+=".";
		temp+=category;*/
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
		collection[j]->Branch(arg1 ,&h1t[i],arg2);
		collection[j]->Branch(arg3 ,&h1b[i],arg4);
		collection[j]->Branch(arg5 ,&h1l[i],arg6);
		collection[j]->Branch(arg7 ,&h1r[i],arg8);
}
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
		collection[j]->Branch(arg1 ,&h2t[i],arg2);
		collection[j]->Branch(arg3 ,&h2b[i],arg4);
		collection[j]->Branch(arg5 ,&h2l[i],arg6);
		collection[j]->Branch(arg7 ,&h2r[i], arg8);
	}
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
		sprintf(tname,"h3t%i",i);
		sprintf(tname2,"h3t%i/I",i);
		sprintf(bname,"h3b%i",i);
		sprintf(bname2,"h3b%i/I",i);
		sprintf(lname,"h3l%i",i);
		sprintf(lname2,"h3l%i/I",i);
		sprintf(rname,"h3r%i",i);
		sprintf(rname2,"h3r%i/I",i);
		arg1.Form(tname);			arg2.Form(tname2);			arg3.Form(bname);			arg4.Form(bname2);
		arg5.Form(lname);			arg6.Form(lname2);			arg7.Form(rname);			arg8.Form(rname2);
		collection[j]->Branch(arg1 ,&h3t[i],arg2);
		collection[j]->Branch(arg3 ,&h3b[i],arg4);
//collection[j]->Branch(arg5 ,&h3l[i],arg6);
//		collection[j]->Branch(arg7 ,&h3r[i],arg8);
	}
	for(int i=1; i<24; i++){
		char* tname[10];
		char* tname2[10];
		char* bname[10];
		char* bname2[10];
		char* lname[10];
		char* lname2[10];
		char* rname[10];
		char* rname2[10];
		char* lname3[10];
		char* lname4[10];
		char* rname3[10];
		char* rname4[10];
		TString arg1; 		TString arg2; 		TString arg3; 		TString arg4; 
		TString arg5; 		TString arg6; 		TString arg7; 		TString arg8; 
		TString arg9; 		TString arg10; 		TString arg11;		TString arg12; 
		sprintf(tname,"h4tu%i",i);
		sprintf(tname2,"h4tu%i/I",i);
		sprintf(bname,"h4bu%i",i);
		sprintf(bname2,"h4bu%i/I",i);
		sprintf(lname,"h4Y1Ll%i",i);
		sprintf(lname2,"h4Y1Ll%i/I",i);
		sprintf(rname,"h4Y1Rl%i",i);
		sprintf(rname2,"h4Y1Rl%i/I",i);
		sprintf(lname3,"h4Y2Ll%i",i);
		sprintf(lname4,"h4Y2Ll%i/I",i);
		sprintf(rname3,"h4Y2Rl%i",i);
		sprintf(rname4,"h4Y2Rl%i/I",i);
		arg1.Form(tname);			arg2.Form(tname2);			arg3.Form(bname);			arg4.Form(bname2);
		arg5.Form(lname);			arg6.Form(lname2);			arg7.Form(rname);			arg8.Form(rname2);
		arg9.Form(lname3);			arg10.Form(lname4);			arg11.Form(rname3);			arg12.Form(rname4);
		collection[j]->Branch(arg1 ,&h4tu[i],arg2);
		collection[j]->Branch(arg3 ,&h4bu[i],arg4);
		collection[j]->Branch(arg5 ,&h4Y1Ll[i],arg6);
		collection[j]->Branch(arg7 ,&h4Y1Rl[i],arg8);
		collection[j]->Branch(arg9 ,&h4Y2Ll[i],arg10);
		collection[j]->Branch(arg11 ,&h4Y2Rl[i],arg12);
	}
	for(int i=1; i<24; i++){
		char* tname[10];
		char* tname2[10];
		char* bname[10];
		char* bname2[10];
		char* lname[10];
		char* lname2[10];
		char* rname[10];
		char* rname2[10];
		char* lname3[10];
		char* lname4[10];
		char* rname3[10];
		char* rname4[10];
		TString arg1; 		TString arg2; 		TString arg3; 		TString arg4; 
		TString arg5; 		TString arg6; 		TString arg7; 		TString arg8; 
		TString arg9; 		TString arg10; 		TString arg11;		TString arg12; 
		sprintf(tname,"h4td%i",i);
		sprintf(tname2,"h4td%i/I",i);
		sprintf(bname,"h4bd%i",i);
		sprintf(bname2,"h4bd%i/I",i);
		sprintf(lname,"h4Y1Lr%i",i);
		sprintf(lname2,"h4Y1Lr%i/I",i);
		sprintf(rname,"h4Y1Rr%i",i);
		sprintf(rname2,"h4Y1Rr%i/I",i);
		sprintf(lname3,"h4Y2Lr%i",i);
		sprintf(lname4,"h4Y2Lr%i/I",i);
		sprintf(rname3,"h4Y2Rr%i",i);
		sprintf(rname4,"h4Y2Rr%i/I",i);
		arg1.Form(tname);			arg2.Form(tname2);			arg3.Form(bname);			arg4.Form(bname2);
		arg5.Form(lname);			arg6.Form(lname2);			arg7.Form(rname);			arg8.Form(rname2);
		arg9.Form(lname3);			arg10.Form(lname4);			arg11.Form(rname3);			arg12.Form(rname4);
		collection[j]->Branch(arg1 ,&h4td[i],arg2);
		collection[j]->Branch(arg3 ,&h4bd[i],arg4);
		collection[j]->Branch(arg5 ,&h4Y1Lr[i],arg6);
		collection[j]->Branch(arg7 ,&h4Y1Rr[i],arg8);
		collection[j]->Branch(arg9 ,&h4Y2Lr[i],arg10);
		collection[j]->Branch(arg11 ,&h4Y2Rr[i],arg12);
	}
	int limit=15000;
	if(j==6){
//	lifmit=32159;
TString querym= "SELECT h.eventID, h.detectorName, h.elementID, g.eventID, g.NIM3 FROM " +table[j]+".Hit AS h LEFT JOIN "+table[j]+ ".Event AS g ON h.eventID=g.eventID WHERE (detectorName LIKE \"H%T%\" OR detectorName LIKE \"H%B%\" OR detectorName LIKE \"H%L%\" OR detectorName LIKE \"H%R%\" OR detectorName LIKE \"H4Y%\") AND g.NIM3=1";
querym += " AND h.inTime=1 ORDER BY h.eventID LIMIT 2000000";
	}
if(j==8){

TString querym= "SELECT h.eventID, h.detectorName, h.elementID, g.eventID FROM " +table[j]+".Hit AS h LEFT JOIN "+table[j]+ ".Event AS g ON h.eventID=g.eventID WHERE (detectorName LIKE \"H%T%\" OR detectorName LIKE \"H%B%\" OR detectorName LIKE \"H%L%\" OR detectorName LIKE \"H%R%\" OR detectorName LIKE \"H4Y%\")";
querym += " AND h.inTime=1 AND ORDER BY h.eventID LIMIT 2000000"; //g.eventID<15000 
	}
	if((j<6)||(j==7)){
TString querym= "SELECT h.eventID, h.detectorName, h.elementID, g.eventID, g.MATRIX1 , d.eventID AS Dimuon, d.mass, g.MATRIX2,  f.MATRIX1, f.MATRIX2, FROM " +table[j]+".Hit AS h LEFT JOIN "+table[j]+ ".Event AS g ON h.eventID=g.eventID LEFT JOIN " + table[j] + ".mDimuon AS d ON h.eventID=d.eventID WHERE (detectorName LIKE \"H%T%\" OR detectorName LIKE \"H%B%\" OR detectorName LIKE \"H%L%\" OR detectorName LIKE \"H%R%\" OR detectorName LIKE \"H4Y%\")";
querym += " AND h.inTime=1 ORDER BY h.eventID LIMIT 500000";
	}



// *** Run Query ***

	cout<<querym<<endl;
	resm[j] = con->Query(querym);
	Int_t nRowsm = resm[j]->GetRowCount();
	cout<<nRowsm<<endl;
	Int_t nhits = 0;
	Int_t ID = 1;
	Int_t ind;
	dimuon=0;
	for(Int_t i = 0; i < nRowsm; i++){
//		if(i%1000) cout<<"steady..."<<endl;
		row[j] = resm[j]->Next(); //moves to the next line
		if(!row[j]) continue;

	// *** End of Event ***
		if(!(ID == atoi(row[j]->GetField(0))))
		{
		collection[j]->Fill();
//		cout<<ID<<"\t"<<nhits<<endl;
			nhits = 0;
		// *** Clean Hodoscope Entries ***
			for(int z= 0; z < 24; z++)
			{
				h1t[z] = 0;
				h1b[z] = 0;
				h1r[z]=0;
				h1l[z]=0;
			}
			for(Int_t k = 0; k< 24; k++)
			{
				h2t[k] = 0;
				h3t[k] = 0;
				h4tu[k] = 0;
				h4td[k] = 0;
				h2b[k] = 0;
				h3b[k] = 0;
				h4bu[k] = 0;
				h4bd[k] = 0;
				h2l[k] = 0;
				h2r[k] = 0;
				h4Y1Ll[k]=0;
				h4Y1Lr[k]=0;
				h4Y2Ll[k]=0;
				h4Y2Lr[k]=0;
				h4Y1Rl[k]=0;
				h4Y1Rr[k]=0;
				h4Y2Rl[k]=0;
				h4Y2Rr[k]=0;

			}
			mass=0;
			ID = atoi(row[j]->GetField(0));
		}
		nhits++;

	// *** Fill Hodoscopes ***
		ind=atoi(row[j]->GetField(2));

		if(strstr(row[j]->GetField(1),"1"))
		{
			if(strstr(row[j]->GetField(1),"T")){
				h1t[ind] += 1; }
			if(strstr(row[j]->GetField(1),"B"))
			{	h1b[ind] += 1; }
			if(strstr(row[j]->GetField(1),"L")) {
				if(!(
					strstr(row[j]->GetField(1),"4")
				)){
				h1l[ind] += 1; }
			}
			if(strstr(row[j]->GetField(1),"R")){
				if(!(
					strstr(row[j]->GetField(1),"4")
				)){
				h1r[ind] += 1; }
			}
		}
	
		if(strstr(row[j]->GetField(1),"2"))
		{
			if(strstr(row[j]->GetField(1),"T")){
				h2t[ind] += 1; }
			if(strstr(row[j]->GetField(1),"B")){
				h2b[ind] += 1; }
			if(strstr(row[j]->GetField(1),"L")) {
				if(!(
					strstr(row[j]->GetField(1),"4")
				)){
				h2l[ind] += 1; }
			}
			if(strstr(row[j]->GetField(1),"R")){
				if(!(
					strstr(row[j]->GetField(1),"4")
				)){
				h2r[ind] += 1; }
			}
		}
	
		if(strstr(row[j]->GetField(1),"3"))
		{
			if(strstr(row[j]->GetField(1),"T"))
				h3t[ind] += 1;
			if(strstr(row[j]->GetField(1),"B"))
				h3b[ind] += 1;
//			if(strstr(row[j]->GetField(1),"L"))
//				h3l[ind] += 1;
//			if(strstr(row[j]->GetField(1),"R"))
//				h3r[ind] += 1;
		}
	
		if(strstr(row[j]->GetField(1),"4"))
		{
			if(strstr(row[j]->GetField(1),"T"))
			{
				if(strstr(row[j]->GetField(1),"u"))
					h4tu[ind] += 1;
				else
					h4td[ind] += 1;
			}
			if(strstr(row[j]->GetField(1),"B"))
			{
				if(strstr(row[j]->GetField(1),"u"))
					h4bu[ind] += 1;
				else
					h4bd[ind] += 1;
			}
			if(strstr(row[j]->GetField(1),"H4Y1"))
//				cout<<"sofar"<<endl;
			{
				if(strstr(row[j]->GetField(1),"H4Y1L")){

					std::string compared="H4Y1Lr";
					std::string comparedl="H4Y1Ll";
					if((row[j]->GetField(1))==compared){
						h4Y1Lr[ind] += 1;}
					if((row[j]->GetField(1))==comparedl)
						h4Y1Ll[ind] += 1;
				}
				else{
					std::string compared="H4Y1Rr";
					std::string comparedl="H4Y1Rl";
					if((row[j]->GetField(1))==compared)
						h4Y1Rr[ind] += 1;
					if((row[j]->GetField(1))==comparedl)
						h4Y1Rl[ind] += 1;
				}				

			}
			if(strstr(row[j]->GetField(1),"H4Y2"))
			{
//				cout<<"sofar"<<endl;
				if(strstr(row[j]->GetField(1),"H4Y2L")){
					std::string compared="H4Y2Lr";
					std::string comparedl="H4Y2Ll";
					if((row[j]->GetField(1))==compared){
						h4Y2Lr[ind] += 1;}
					if((row[j]->GetField(1))==comparedl)
						h4Y2Ll[ind] += 1;
				}
				else{
					std::string compared="H4Y2Rr";
					std::string comparedl="H4Y2Rl";
					if((row[j]->GetField(1))==compared)
						h4Y2Rr[ind] += 1;
					if((row[j]->GetField(1))==comparedl)
						h4Y2Rl[ind] += 1;
				}				

			}
		}
	//	TString ts = row[j]->GetField(0);
		if(j>5)//ts.IsNull()
		{
			dimuon = 0;
			mass=0;
			MATRIX1=-1;
		}
		else{
			dimuon = 1;
			mass=atof(row[j]->GetField(5));
			MATRIX1=atoi(row[j]->GetField(6));
		}
	
	}
		collection[j]->Write();
	}
}
