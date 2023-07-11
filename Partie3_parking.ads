with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with voiture;             use voiture;

package parking is

   NB_MAX : constant Integer := 200;
   type tabVoiture is array (1 .. NB_MAX) of Type_Voiture;

   -- Definir le type de donnée Type_Parking
   type Type_Parking is record
      voitures    : tabVoiture;
      nb_voitures : Integer :=0;
   end record;

   procedure remplir_parking (p : out Type_Parking);
   procedure afficher_parking (p : in Type_Parking);
   procedure trouver_voiture
     (p    : in     Type_Parking; v : in Type_Voiture; res : out Boolean;
      rang :    out Integer);
   procedure ajouter_voiture (p : in out Type_Parking);
   procedure ajouter_voiture_pos
     (p : in out Type_Parking; v : in Type_Voiture);
   procedure supprimer_voiture (p : in out Type_Parking);
   procedure supprimer_voiture_pos (p : in out Type_Parking);
end parking;
