with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with voiture;             use voiture;
with parking;             use parking;

package actions_parking is

   --calcules les places disponibles du parking p de type Type Parking
   function nb_places_disponibles (p : in Type_Parking) return Integer;

   --calcule la tarif que le parking devrait appliquer à une durée de stationnement d
   procedure obtenir_tarif (p : in Type_Parking; v : in Type_Voiture);

   -- retourne la voiture qui a la plus longue dur´ee de stationnement
   function obtenir_voiture_plus_longue_duree
     (p : in Type_Parking) return Type_Voiture;

   -- retourne la voiture qui a la plus grande numéro de place
   function obtenir_voiture_plus_grand_num_place
     (p : in Type_Parking) return Type_Voiture;

   --lit les informations du parking p de type Type Parking `a partir d’un fichier filename
   procedure lire_parking_from_file (p : out Type_Parking ; name: String);

end actions_parking;
