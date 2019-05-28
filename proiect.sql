 -- 1
 create or replace procedure adauga_Pacient(id NUMBER, nume VARCHAR2, prenume VARCHAR2,
                              inaltime NUMBER, greutate NUMBER, sex CHAR, telefon NUMBER,
                              data_nastere DATE, categorie VARCHAR2) is
begin
INSERT INTO PACIENT( ID, NUME, PRENUME, INALTIME, GREUTATE,SEX, TELEFON, DATA_NASTERE,CATEGORIE) VALUES( id ,nume, prenume, inaltime,greutate,
                     sex,telefon, data_nastere, categorie);
end;
exec adauga_Pacient( 2000101, 'Basescu', 'Ioana', 130 , 70, 'F', '0763028800', '28-DEC-1998', 'adult');

--2
create or replace procedure realizare_factura(id NUMBER, id_fisa_pacient NUMBER, plata NUMBER) is
begin 

INSERT INTO FACTURA(id, id_fisa_pacient, plata) VALUES (id, id_fisa_pacient, plata);
end;
exec realizare_factura(2000002, 1000, 14560);

SELECT COUNT(id) FROM FACTURA;

--3 
 create or replace procedure nr_zile_internare(id_pac in FISA_PACIENT.id_pacient%type, id_doc FISA_PACIENT.ID_DOCTOR%TYPE)
 is
 numar NUMBER;
 begin 
    SELECT TO_DATE(f.data_externare)-TO_DATE(f.data_internare) into numar FROM FISA_PACIENT f  WHERE f.id_pacient=id_pac and f.ID_DOCTOR=id_doc
     and ROWNUM=1
     ORDER BY data_externare DESC;
     
    DBMS_OUTPUT.PUT_LINE(numar);
    
   end;
exec nr_zile_internare(14, 40);

--4
      create or replace procedure marire_salariu1(in_id_personal STAFF.id%type)
      is
      valoare STAFF.salariu%type:=250;
       valoare_salariu STAFF.salariu%type:=0; 
      begin
      
      SELECT salariu into valoare_salariu FROM staff where in_id_personal=id;
       valoare_salariu:=valoare_salariu+valoare;
       update STAFF set salariu = valoare_salariu
    where in_id_personal = id;
    end;
    exec marire_salariu1(1);
    SELECT * FROM staff;
    
    --5
    
   set serveroutput on;
create or replace procedure factura1(in_id FISA_PACIENT.id_pacient%type)
    is 
    numar number;
    begin
    SELECT * into numar FROM(SELECT plata  FROM FACTURA f JOIN FISA_PACIENT p on f.id_fisa_pacient=p.id WHERE p.id_pacient=in_id
    ORDER BY data_internare DESC)
    WHERE ROWNUM=1;
      DBMS_OUTPUT.PUT_LINE(numar);
      end;
    exec factura1(10);
     --7
     SET SERVEROUT ON;
      create or replace procedure numar_fisa_pacient(in_id FISA_PACIENT.id_pacient%type)
      is 
      numar NUMBER;
      begin 
      SELECT count(id) into numar FROM fisa_pacient WHERE id_pacient=in_id;
       DBMS_OUTPUT.PUT_LINE(numar);
      end;
      
      exec numar_fisa_pacient(15);
      
      SELECT ID_PACIENT from fisa_pacient;
      
      --8
      
      create or replace procedure adauga_Personal(ID staff.ID%TYPE, cnp staff.cnp%type, nume staff.nume%type, prenume staff.prenume%type,
                      functie staff.functie%type, salariu staff.salariu%type)
     is 
     begin
     
     INSERT INTO STAFF(ID, CNP, NUME, PRENUME, FUNCTIE,SALARIU) values(ID,cnp,nume,prenume,functie,salariu);
     end;
     exec adauga_Personal(160, 012345678, 'Baciu', 'Narcisa','asistent','4500');
    select COUNT(ID) FROM STAFF;
    
    --9 
    create or replace procedure garda_x_1( id_p RAPORT.id_personal%type, ora_s RAPORT.ora_start%type, ora_f RAPORT.ora_final%type, 
                                         data_r RAPORT.data_raport%type)
    is
    p_mesaj VARCHAR2(100);
    cursor c is 
    SELECT s.nume, s.prenume, s.functie FROM raport r  JOIN staff s on r.id_personal=s.id WHERE r.ora_start=ora_s and r.ora_final=ora_f
                      and id_p=r.id_personal and r.data_raport=data_r;
    begin 
    for c_record in c loop
     p_mesaj:=(c_record.nume||' '||c_record.prenume||' '|| c_record.functie);
      dbms_output.put_line(p_mesaj);
     end loop;
    end;
    exec garda_x_1(1,2,4,'19-MAR-17');
    
    --6
    set serverout on;
create or replace procedure localizare_pacient(id_pac FISA_PACIENT.id_pacient%type)
is
camera NUMBER;
denum VARCHAR2(30);
begin
 
 SELECT * INTO camera, denum FROM( SELECT c.id, s.denumire  FROM fisa_pacient f JOIN doctor d on d.id=f.id_doctor JOIN sectie s on s.id=d.id_sectie
            JOIN camera c on c.id_sectie=s.id WHERE f.id_pacient=id_pac ORDER BY f.data_internare DESC) WHERE ROWNUM=1;
        DBMS_OUTPUT.PUT_LINE(camera||'  '||denum);
end;
    
    exec localizare_pacient(34);
    
    