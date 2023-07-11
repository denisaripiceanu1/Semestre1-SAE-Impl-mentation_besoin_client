with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with voiture;             use voiture;
with parking;             use parking;

procedure test_parking is

   p    : Type_Parking;
   v    : Type_Voiture;
   res  : Boolean;
   rang : Integer;
begin
   remplir_parking (p);
   Put ("Ajoutez une voiture : ");
   New_Line;
   New_Line;
   lire_voiture (v);
   Put ("Test ajouter_voiture_pos : ");
   New_Line;
   ajouter_voiture_pos (p, v);
   Put ("Test afficher_parking : ");
   New_Line;
   afficher_parking (p);
   Put ("Test supprimer_voiture_pos : ");
   New_Line;
   supprimer_voiture_pos (p);
   Put ("Test afficher_parking : ");
   New_Line;
   afficher_parking (p);
   trouver_voiture (p, v, res, rang);

end test_parking;
