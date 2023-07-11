with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with voiture;             use voiture;
with parking;             use parking;
with actions_parking;     use actions_parking;

procedure test_actions_parking is

   p : Type_Parking;
   v : Type_Voiture;
begin

   Put ("Dans notre parking, il reste ");
   Put (nb_places_disponibles (p));
   Put (" places disponibles");
   New_Line;

   Put ("La voiture qui a la plus grande numero de place est : ");
   afficher_voiture (obtenir_voiture_plus_grand_num_place (p));
   New_Line;
   Put ("La voiture qui a la plus longue duree de stationnement est : ");
   afficher_voiture (obtenir_voiture_plus_longue_duree (p));
   New_Line;
   lire_parking_from_file (p, "filename.txt");

end test_actions_parking;
