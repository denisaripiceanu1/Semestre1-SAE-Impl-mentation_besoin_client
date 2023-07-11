with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with voiture;             use voiture;

procedure test is
   voit  : Type_Voiture;
   i     : Integer;
   voit1 : Type_Voiture;
begin
   -- lire et afficher une voiture
   lire_voiture (voit);
   afficher_voiture (voit);

   -- afficher la place du parking er la durée du stationnement en secondes
   Put ("La voiture est garee a la place : ");
   Put (obtenir_num_place (voit));
   New_Line;
   Put (calculer_duree_stationnement (voit));
   New_Line;
   -- afficher le numéro d'immatriculation
   i := 1;
   Put ("La voiture avec numero d'immatriculation : ");
   while i <= TAILLE_MAX loop
      Put (obtenir_matricule (voit) (i));
      i := i + 1;
   end loop;
   New_Line;
   --comparer deux voitures
   Put_Line ("--- Comparaison avec une autre voiture ---");
   lire_voiture (voit1);
   New_Line;
   if egalite (voit, voit1) then
      Put ("Les numeros d'immatriculation sont identiques! ");
   end if;

end test;
