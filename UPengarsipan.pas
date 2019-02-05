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


procedure lihat_data();
var
    i : integer;
begin
    if (banyakdata>0) then
    begin
        clrscr;
            //   000000000111111111122222222223333333333444444444455555555556
            //   123456789012345678901234567890123456789012345678901234567890
        writeln('|  NO SURAT  |      PERIHAL     | JENIS SURAT |  PENGIRIM  |');
        writeln('------------------------------------------------------------');
        for i:= 1 to banyakdata do
        begin
            gotoxy(3, i+3);write(surat[i].no_surat);
            gotoxy(16, i+3);write(surat[i].perihal);
            gotoxy(35, i+3);write(surat[i].jenis_surat);
            gotoxy(49, i+3);write(surat[i].pengirim);
        end;
        writeln();
        writeln('Tekan enter untuk melanjutkan.');
        readln();
    end;
end;

//yusuf
procedure tambah_data();
begin
    
end;

//Yusuf
procedure bacaFile();

//Alif
procedure ubah_data();
begin
    
end;

procedure urutkan_data();
begin
    
end;

//Alif
procedure Pencarian_Jenis;
var 
    i:integer;
    dicari:string[10];
begin
    writeln('Pencarian Berdasarkan Jenis');
    write('Jenis yang dicari    : ')readln(dicari);
    i:=1
    while(baranng[i].Jenis <> dicari) and (i < banyakdata) do 
        i:=i+1;
    if barang[i].Jenis = dicari then 
        writeln('Data ditemukan diposisi ke-',i)
    else
        writeln('Maaf Data Tidak Ditemukan');
    readln
end;

procedure Pencarian_Perihal;
var 
    i:integer;
    dicari:string[10];
begin
    writeln('Pencarian Berdasarkan Jenis');
    write('Jenis yang dicari    : ')readln(dicari);
    i:=1
    while(baranng[i].Jenis <> dicari) and (i < banyakdata) do 
        i:=i+1;
    if barang[i].Jenis = dicari then 
        writeln('Data ditemukan diposisi ke-',i)
    else
        writeln('Maaf Data Tidak Ditemukan');
    readln
end;

procedure Pencarian_Nomor_Surat;
var 
    i:integer;
    dicari:string[10];
begin
    writeln('Pencarian Berdasarkan Jenis');
    write('Jenis yang dicari    : ')readln(dicari);
    i:=1
    while(baranng[i].Jenis <> dicari) and (i < banyakdata) do 
        i:=i+1;
    if barang[i].Jenis = dicari then 
        writeln('Data ditemukan diposisi ke-',i)
    else
        writeln('Maaf Data Tidak Ditemukan');
    readln
end;

procedure Pencarian_Pengirim;
var 
    i:integer;
    dicari:string[10];
begin
    writeln('Pencarian Berdasarkan Jenis');
    write('Jenis yang dicari    : ')readln(dicari);
    i:=1
    while(baranng[i].Jenis <> dicari) and (i < banyakdata) do 
        i:=i+1;
    if barang[i].Jenis = dicari then 
        writeln('Data ditemukan diposisi ke-',i)
    else
        writeln('Maaf Data Tidak Ditemukan');
    readln
end;

procedure cari_data();
var 
    pil:integer;
begin
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

function menu() : integer;
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
    //bacaFile();
    repeat
        clrscr;
        pilihan_menu := menu();
        case pilihan of
            1 : lihat_data();
            2 : tambah_data();
            3 : ubah_data();
             4 : hapus_data();
            5 : urutkan_data();
            6 : cari_data();
            0 : ;
            else writeln('pilihan tidak dikenal');
        end;
    until (pilihan_menu = 0);
    //simpanFila();
end.
