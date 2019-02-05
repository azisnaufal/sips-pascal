program UPengarsipan;
uses crt, sysutils;

const
    maks = 100;
    namafile = 'sips.dat';

type
    TSurat = record 
        jenis_surat : string[10];
        perihal : string[20];
        no_surat : string[10];
        pengirim : string[10];
    end;

var
    surat : array[1..maks] of TSurat;
    banyakdata : integer;
    pilihan_menu : integer;

procedure lihat_data();
begin
    
end;

procedure tambah_data();
begin
    
end;
//Alif
procedure ubah_data();
begin
    
end;

procedure urutkan_data();
begin
    
end;

//Alif
procedure cari_data();
begin
    
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
