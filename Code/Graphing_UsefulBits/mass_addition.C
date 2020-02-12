void mass_addition(){
	TString category="jDimuon";
	TString column= "mass";
	
//	TCanvas* c1 = new TCanvas("c1", ""); 
	const Char_t* host = "mysql://seaquel.physics.illinois.edu:3283/";
	const Char_t* user = "seaguest";
	const Char_t* pass = "qqbar2mu+mu-"; 


	TSQLServer* con = TSQLServer::Connect(host, user, pass); 
	TSQLResult* res;
	TSQLRow* row;
	TString query = "SELECT ";
	query+=column;
	query += " FROM ";

	query+="run_008730_R004.jDimuon UNION ALL SELECT mass FROM run_008731_R004.jDimuon UNION ALL SELECT mass FROM run_008732_R004.jDimuon UNION ALL SELECT mass FROM run_008733_R004.jDimuon UNION ALL SELECT mass FROM run_008734_R004.jDimuon UNION ALL SELECT mass FROM run_008735_R004.jDimuon UNION ALL SELECT mass FROM run_008736_R004.jDimuon UNION ALL SELECT mass FROM run_008737_R004.jDimuon UNION ALL SELECT mass FROM run_008738_R004.jDimuon UNION ALL SELECT mass FROM run_008739_R004.jDimuon UNION ALL SELECT mass FROM run_008740_R004.jDimuon";

	TFile *f= new TFile("real_jtrack_tree.root","UPDATE");
	TTree * t1 = (TTree*) f->Get("t");
	int dimuon;
	float mass;
	t1->SetBranchAddress("dimuon", &dimuon);
	TBranch *b1= t1->Branch("mass",&mass,"mass/F");

	res = con->Query(query);
	int dimuons=0;
	
	for(int i=0; i<t1->GetEntries(); i++){
		t1->GetEntry(i);
		if(dimuon>0){
			row = res -> Next();
			mass=atof(row->GetField(0));
		}
		else mass=0;
		b1->Fill();
	} 
	t1->Write();
}
