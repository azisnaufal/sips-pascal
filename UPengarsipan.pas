program UPengarsipan;
uses crt, sysutils;

const
    maks = 100;
    namafile = 'sips.dat';

type
    TSurat = record 
        jenis_surat : string[10];
        perihal : string[16];
        no_surat : string[10];
        pengirim : string[10];  
    end;

var
    surat : array[1..maks] of TSurat;
    banyakdata : integer;
    pilihan_menu : integer;

procedure bacaFile; //Membaca file // Yusuf 
    var
        f:file of TSurat;
    begin
        if FileExists(namafile) then 
            begin
                assign(f,namafile);
                reset(f);
                while not eof(f) do 
                    begin
                        banyakdata:=banyakdata+1;
                        read(f,surat[banyakdata]);
                    end;
                close(f);
            end;
        writeln('File tidak ditemukan');
    end;

procedure simpanFile();
    var
        f:file of TSurat;
        i:integer;
    begin
        assign(f,namafile);
        rewrite(f);
        for i:=1 to banyakdata do
            write(f,surat[i]);
        close(f);
    end;

procedure lihat_data; //menampilkan data // Azis
    var
        i : integer;
    begin
        if (banyakdata>0) then
        begin
            clrscr;
                //   000000000111111111122222222223333333333444444444455555555556666666666
                //   123456789012345678901234567890123456789012345678901234567890123456789
            writeln('--------------------------------------------------------------------');
            writeln('| NO |  NO SURAT  |      PERIHAL     |  JENIS SURAT  |  PENGIRIM   |');
            writeln('--------------------------------------------------------------------');
            for i:= 1 to banyakdata do
            begin
                gotoxy(2, i+3);write(i);
                gotoxy(8, i+3);write(surat[i].no_surat);
                gotoxy(21, i+3);write(surat[i].perihal);
                gotoxy(40, i+3);write(surat[i].jenis_surat);
                gotoxy(56, i+3);write(surat[i].pengirim);
            end;
            writeln();
            write('Tekan enter untuk melanjutkan.');
        end
        else
            writeln('Data pengarsipan surat masuk belum diisi.');
        readln();
    end;

procedure tambah_data;//Menambahkan data // yusuf
    begin
        clrscr;
        if banyakdata<maks then 
            begin
                banyakdata:=banyakdata+1;
                writeln('Data surat masuk ke-',banyakdata);
                write('Jenis surat : ');readln(surat[banyakdata].jenis_surat);
                write('Perihal Surat : ');readln(surat[banyakdata].perihal);
                write('no surat : ');readln(surat[banyakdata].no_surat);
                write('Pengirim : ');readln(surat[banyakdata].pengirim);
            end
        else 
            begin
                writeln('batas data sudah mencapai batas maksimum');
            end;
    end;

procedure ubah_data;//ubah data // alif
    var 
        i:integer;
    begin
        clrscr;
        if banyakdata >= 1 then
        begin
            write('Data Nomor Berapa Yang Ingin Diubah : ');readln(i);
            write('Jenis Surat   : ');readln(surat[i].jenis_surat);
            write('Perihal Surat : ');readln(surat[i].perihal);
            write('Nomor Surat : ');readln(surat[i].no_surat);
            write('Pengirim : ');readln(surat[i].pengirim);
            write('Data  Berhasil Diubah');
            readln();
        end
        else
        begin
            write('Data Kosong');readln;
        end;  
    end;

procedure hapus_data;
    var
        i : integer;
        yakin : string;
        temp : TSurat;
    begin
        clrscr;
        if (banyakdata <> 0) then 
        begin
            write('Data di posisi berapa yang mau Anda hapus? (1 - ', banyakdata, ')');
            readln(i);
            write('Apakah anda yakin? [Y/T]');
            readln(yakin);
            if (yakin = 'y') or (yakin = 'Y') then
            begin 
                surat[i].jenis_surat := '';
                surat[i].no_surat := '';
                surat[i].pengirim := '';
                surat[i].perihal := '';

                while(surat[i+1].jenis_surat <> '') do
                begin
                    temp := surat[i];
                    surat[i] := surat[i+1];
                    surat[i+1] := temp;
                    i := i + 1;
                end;

                banyakdata := banyakdata - 1;

                writeln();
                writeln('Data berhasil dihapus!');
                write('Tekan enter untuk melanjutkan');
                readln;
            end
            else
            begin
                writeln();
                writeln('Penghapusan dibatalkan!');
                write('Tekan enter untuk melanjutkan');
                readln;
            end;
        end
        else
        begin
            writeln('Data kosong');readln;
        end;
    end;

procedure pengurutan_jenis_asc;//pengurutan jenis ASC (bubble sort) //alif
    var
        tahap, i:integer;
        temp:TSurat;
    begin
        for tahap := 1 to banyakdata -1 do
        begin
            for i:=banyakdata downto 2 do
            begin    
                if surat[i].jenis_surat < surat[i-1].jenis_surat then
                begin
                    temp:=surat[i];
                    surat[i]:=surat[i-1];
                    surat[i-1]:=temp;
                end;
            end;
        end;
        writeln('Pengurutan Berdasarkan Jenis Surat Selesai');readln;
    end;

procedure pengurutan_jenis_dsc;//Pengurutan Jenis DSC (bubble sort) //alif 
    var
        tahap, i:integer;
        temp:TSurat;
    begin
        for i := 1 to banyakdata -1 do
        begin
            for tahap:=banyakdata downto i+1 do
            begin    
                if surat[tahap].jenis_surat > surat[tahap-1].jenis_surat then
                begin
                    temp:=surat[tahap];
                    surat[tahap]:=surat[tahap-1];
                    surat[tahap-1]:=temp;
                end;
            end;
        end;
        writeln('Pengurutan Berdasarkan Jenis Surat Selesai');readln;
    end;

procedure pengurutan_jenis;//menu pengurutan Jenis ASC or DSC //alif
    var
        pil:integer;
    begin
        repeat 
            clrscr;
                writeln('1. Pengurutan Ascending');
                writeln('2. Pengurutan Descending');
                writeln('0. Kembali');
                writeln('--------------------------------------');
                writeln('Pilihan Anda : ');readln(pil);
                case pil of 
                    1:pengurutan_jenis_asc();
                    2:pengurutan_jenis_dsc();
                    0:;
                end;
        until pil = 0;
    end;

procedure pengurutan_perihal_asc;//Pengurutan Perihal ASC (bubble sort)//Alif
    var
        tahap, i:integer;
        temp:TSurat;
    begin
        for tahap := 1 to banyakdata -1 do
        begin
            for i:=banyakdata downto 2 do
            begin    
                if surat[i].perihal < surat[i-1].perihal then
                begin
                    temp:=surat[i];
                    surat[i]:=surat[i-1];
                    surat[i-1]:=temp;
                end;
            end;
        end;
        writeln('Pengurutan Berdasarkan Jenis Surat Selesai');readln;
    end;

procedure pengurutan_perihal_dsc;//Pengurutan Perihal DSC (bubble sort)//Alif 
    var
        tahap, i:integer;
        temp:TSurat;
    begin
        for i:= 1 to banyakdata -1 do
        begin
            for tahap:=banyakdata downto i+1 do
            begin    
                if surat[tahap].perihal > surat[tahap-1].perihal then
                begin
                    temp:=surat[tahap];
                    surat[tahap]:=surat[tahap-1];
                    surat[tahap-1]:=temp;
                end;
            end;
        end;
        writeln('Pengurutan Berdasarkan Jenis Surat Selesai');readln;
    end;

procedure pengurutan_perihal;//menu pengurutan perihal ASC or DSC // Alif 
    var
        pil:integer;
    begin
        repeat
            clrscr;
                writeln('1. Pengurutan Ascending');
                writeln('2. Pengurutan Descending');
                writeln('0. Kembali');
                writeln('--------------------------------------');
                writeln('Pilihan Anda : ');readln(pil);
                case pil of 
                    1:pengurutan_perihal_asc;
                    2:pengurutan_perihal_dsc;
                    0:;
                end;
        until pil = 0;
    end;

//Pengurutan nomor surat ASC // tinggal pengurtan dsc sama aziz
// Maximum sort Ascending
procedure pengurutan_no_surat_asc;
var 
    i,j,maks,x:integer;
    temp:TSurat;
begin
    x:=banyakdata;
    for i:=1 to banyakdata-1 do
    begin
        maks:=1;
        for j:=2 to x do
        begin
            if surat[j].no_surat > surat[maks].no_surat then 
            begin
                maks:=j;
            end;
        end;
        temp:=surat[maks];
        surat[maks]:=surat[j];
        surat[j]:=temp;
        x:= x-1;
    end;
end;

procedure pengurutan_no_surat_dsc;
var 
    i,j,min:integer;
    temp:TSurat;
begin
    for i:=1 to banyakdata-1 do
    begin
        min:=i;
        for j:=1 to banyakdata do
        begin
            if surat[j].no_surat > surat[min].no_surat then
            begin 
                min:=j;
            end;
        end;
        temp:=surat[i];
        surat[i]:=surat[min];
        surat[min]:=temp;
    end;
end;

procedure pengurutan_no_surat;//Menu pengurutan nomor surat ASC or DSC //Alif 
    var
        pil:integer;
    begin
        repeat
            clrscr;
                writeln('1. Pengurutan Ascending');
                writeln('2. Pengurutan Descending');
                writeln('0. Kembali');
                writeln('--------------------------------------');
                writeln('Pilihan Anda : ');readln(pil);
                case pil of 
                    1:pengurutan_no_surat_asc();
                    2:pengurutan_no_surat_dsc();
                    0:;
                end;
        until pil = 0;
    end;

//Pengurutan pengirm ASC 
// Maximum sort Ascending
procedure pengurutan_pengirim_asc;
var 
    i,j,maks,x:integer;
    temp:TSurat;
begin
    x:=banyakdata;
    for i:=1 to banyakdata-1 do
    begin
        maks:=1;
        for j:=2 to x do
        begin
            if surat[j].pengirim > surat[maks].pengirim then
            begin 
                maks:=j;
            end;
        end;
        temp:=surat[maks];
        surat[maks]:=surat[j];
        surat[j]:=temp;
        x:= x-1;
    end;
end;

procedure pengurutan_pengirim_dsc;
var 
    i,j,min:integer;
    temp:TSurat;
begin
    for i:=1 to banyakdata-1 do
    begin
        min:=i;
        for j:=1 to banyakdata do
        begin
            if surat[j].pengirim > surat[min].pengirim then
            begin 
                min:=j;
            end;
        end;
        temp:=surat[i];
        surat[i]:=surat[min];
        surat[min]:=temp;
    end;
end;

procedure pengurutan_pengirim;//Menu pengurutan nomor surat ASC or DSC //Alif 
    var
        pil:integer;
    begin
        repeat
            clrscr;
                writeln('1. Pengurutan Ascending');
                writeln('2. Pengurutan Descending');
                writeln('0. Kembali');
                writeln('--------------------------------------');
                writeln('Pilihan Anda : ');readln(pil);
                case pil of 
                    1:pengurutan_pengirim_asc();
                    2:pengurutan_pengirim_dsc();
                    0:;
                end;
        until pil = 0;
    end;

procedure pengurutan;
    var 
        pilrut:integer;
    begin
        clrscr;
        repeat
        writeln('1.Pengurutan jenis');
        writeln('2.Pengurutan Perihal');
        writeln('3.Pengurutan Nomor Surat');
        writeln('4.Pengurutan Pengirim');
        writeln('0.Kembali');
        writeln('----------------------------');
        writeln('masukan Pilihan anda : ');readln(pilrut);
        case pilrut of
            1 : pengurutan_jenis;
            2 : pengurutan_perihal;
            3 : pengurutan_no_surat;
            4 : pengurutan_pengirim;
            0 : ;
            else writeln('Pilihan tidak dikenal');
        end;
        until pilrut=0;
    end;


//Alif
procedure Pencarian_Jenis;
    var 
        i:integer;
        dicari:string[10];
    begin
        clrscr;
        writeln('Pencarian Berdasarkan Jenis');
        write('Jenis yang dicari    : ');readln(dicari);
        i:=1;
        while(surat[i].jenis_surat <> dicari) and (i < banyakdata) do 
            i:=i+1;
        if surat[i].jenis_surat = dicari then 
        begin
            writeln('Data ditemukan diposisi ke-',i);

            writeln('--------------------------------------------------------------------');
            writeln('| NO |  NO SURAT  |      PERIHAL     |  JENIS SURAT  |  PENGIRIM   |');
            writeln('--------------------------------------------------------------------');
            gotoxy(2, 7);write(i);
            gotoxy(8, 7);write(surat[i].no_surat);
            gotoxy(21, 7);write(surat[i].perihal);
            gotoxy(40, 7);write(surat[i].jenis_surat);
            gotoxy(56, 7);write(surat[i].pengirim);
            
            writeln();
            end
        else
            writeln('Maaf Data Tidak Ditemukan');
        readln;
    end;

procedure Pencarian_Perihal;
    var 
        i:integer;
        dicari:string[16];
    begin
        clrscr;
        writeln('Pencarian Berdasarkan Perihal');
        write('Perihal yang dicari    : ');readln(dicari);
        i:=1;
        while(surat[i].perihal <> dicari) and (i < banyakdata) do 
            i:=i+1;
        if surat[i].perihal = dicari then
        begin 
            writeln('Data ditemukan diposisi ke-',i);

            writeln('--------------------------------------------------------------------');
            writeln('| NO |  NO SURAT  |      PERIHAL     |  JENIS SURAT  |  PENGIRIM   |');
            writeln('--------------------------------------------------------------------');
            gotoxy(2, 7);write(i);
            gotoxy(8, 7);write(surat[i].no_surat);
            gotoxy(21, 7);write(surat[i].perihal);
            gotoxy(40, 7);write(surat[i].jenis_surat);
            gotoxy(56, 7);write(surat[i].pengirim);
            
            writeln();
        end
        else
            writeln('Maaf Data Tidak Ditemukan');
        readln
    end;

procedure Pencarian_Nomor_Surat;
    var 
        i:integer;
        dicari:string[10];
    begin
        clrscr;
        writeln('Pencarian Berdasarkan Nomor Surat');
        write('Nomor Surat yang dicari    : ');readln(dicari);
        i:=1;
        while(surat[i].no_surat <> dicari) and (i < banyakdata) do 
            i:=i+1;
        if surat[i].no_surat = dicari then
        begin 
            writeln('Data ditemukan diposisi ke-',i);

            writeln('--------------------------------------------------------------------');
            writeln('| NO |  NO SURAT  |      PERIHAL     |  JENIS SURAT  |  PENGIRIM   |');
            writeln('--------------------------------------------------------------------');
            gotoxy(2, 7);write(i);
            gotoxy(8, 7);write(surat[i].no_surat);
            gotoxy(21, 7);write(surat[i].perihal);
            gotoxy(40, 7);write(surat[i].jenis_surat);
            gotoxy(56, 7);write(surat[i].pengirim);
            
            writeln();
            end
        else
            writeln('Maaf Data Tidak Ditemukan');
        readln
    end;

procedure Pencarian_Pengirim;
    var 
        i:integer;
        dicari:string[10];
    begin
        clrscr;
        writeln('Pencarian Berdasarkan Pengirim');
        write('Pengirim yang dicari    : ');readln(dicari);
        i:=1;
        while(surat[i].pengirim <> dicari) and (i < banyakdata) do 
            i:=i+1;
        if surat[i].pengirim = dicari then
        begin 
            writeln('Data ditemukan diposisi ke-',i);

            writeln('--------------------------------------------------------------------');
            writeln('| NO |  NO SURAT  |      PERIHAL     |  JENIS SURAT  |  PENGIRIM   |');
            writeln('--------------------------------------------------------------------');
            gotoxy(2, 7);write(i);
            gotoxy(8, 7);write(surat[i].no_surat);
            gotoxy(21, 7);write(surat[i].perihal);
            gotoxy(40, 7);write(surat[i].jenis_surat);
            gotoxy(56, 7);write(surat[i].pengirim);
            
            writeln();
            end
        else
            writeln('Maaf Data Tidak Ditemukan');
        readln
    end;

procedure cari_data();
    var 
        pil:integer;
    begin
        clrscr;
        writeln('Menu Pencarian Data' );
        writeln('-------------------' );
        writeln('1. Berdasarkan Jenis');
        writeln('2. Berdasarkan Perihal');
        writeln('3. Berdasarkan Nomor Surat');
        writeln('4. Berdasarkan pengirim');
        write('Pilihan Anda : ');
        readln(pil);
        case pil of 
            1 : Pencarian_Jenis;
            2 : Pencarian_Perihal;
            3 : Pencarian_Nomor_Surat;
            4 : Pencarian_Pengirim;
            else writeln('Pilihan tidak ditemukan');
        end;
    end;

function menu: integer; //aziis
    var
        pil : integer;
    begin
        writeln('Aplikasi Pengarsipan Surat Masuk');
        writeln('Dibuat oleh : ');
        writeln('    - Alif Ramdhan   (10118365)');
        writeln('    - Muhammad Yusuf (10118370)');
        writeln('    - Azis Naufal    (10118395)');
        writeln('-------------------------------');
        writeln();
        writeln('1. Lihat Data');
        writeln('2. Tambah Data');
        writeln('3. Ubah Data');
        writeln('4. Hapus Data');
        writeln('5. Pengurutan Data');
        writeln('6. Pencarian Data');
        writeln('0. Keluar');
        writeln('-------------------------------');
        write('Pilihan anda: ');readln(pil);
        menu := pil;
    end;

begin
    banyakdata:=0;
    bacaFile();
    repeat
        clrscr;
        pilihan_menu := menu();
        case pilihan_menu of
            1 : lihat_data;
            2 : tambah_data;
            3 : ubah_data;
            4 : hapus_data;
            5 : pengurutan;
            6 : cari_data;
            0 : ;
            else writeln('pilihan tidak dikenal');
        end;
    until pilihan_menu = 0;
    simpanFile();
end.