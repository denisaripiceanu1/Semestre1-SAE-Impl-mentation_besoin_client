with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with voiture;             use voiture;
with parking;             use parking;

package body actions_parking is

   --calcules les places disponibles du parking p de type Type Parking
   function nb_places_disponibles (p : in Type_Parking) return Integer is
   begin
      return NB_MAX - p.nb_voitures;
   end nb_places_disponibles;

   --calcule la tarif que le parking devrait appliquer à une durée de stationnement d
   procedure obtenir_tarif (p : in Type_Parking; v : in Type_Voiture) is
      x : Integer;
   begin
      if p.nb_voitures = 0 then
         Put ("Le parking est vide");
      else
         x := calculer_duree_stationnement (v);
         Put (x);
         Put ("  est la duree du stationnement ");
         New_Line;
         if x > 0 and x <= 3_600 then
            Put ("Le tarif est : 0.16");
         else
            if x > 3_600 and x <= 7_200 then
               Put ("Le tarif est : 0.20");
            else
               if x > 7_200 and x <= 10_800 then
                  Put ("Le tarif est : 0.32");
               else
                  Put ("Le tarif est : 0.6");
               end if;
            end if;
         end if;
      end if;
   end obtenir_tarif;

   -- retourne la voiture qui a la plus longue dur´ee de stationnement
   function obtenir_voiture_plus_longue_duree
     (p : in Type_Parking) return Type_Voiture
   is
      i       : Integer; -- indice pour parcourir le parking
      minVoit : Type_Voiture; --voiture avec heure d'arrivée la plus basse
   begin

      minVoit := p.voitures (1);
      i       := 2;
      while i <= p.nb_voitures loop
         if p.voitures (i).heureEntree < minVoit.heureEntree then
            minVoit := p.voitures (i);
         end if;
         i := i + 1;
      end loop;
      return minVoit;

   end obtenir_voiture_plus_longue_duree;

   -- retourne la voiture qui a la plus grande numéro de place
   function obtenir_voiture_plus_grand_num_place
     (p : in Type_Parking) return Type_Voiture
   is
      maxVoit : Type_Voiture; --voiture avec la plus grande numéro de place
      i       : Integer;
   begin
      maxVoit := p.voitures (1);
      i       := 2;
      while i <= p.nb_voitures loop
         if p.voitures (i).place > maxVoit.place then
            maxVoit := p.voitures (i);
         end if;
         i := i + 1;
      end loop;
      return maxVoit;
   end obtenir_voiture_plus_grand_num_place;

   --lit les informations du parking p de type Type Parking `a partir d’un fichier filename
   procedure lire_parking_from_file (p : out Type_Parking; name : String) is
      fichier : File_Type;
      car     : Character;
      place   : Integer;
      time    : Integer;
      i       : Integer;
   begin
      Open (fichier, In_File, name);
      p.nb_voitures := 0;

      while not End_Of_File (fichier) loop
         p.nb_voitures := p.nb_voitures + 1;
         i             := 1;
         while i <= 9 loop
            Get (fichier, car);
            p.voitures (p.nb_voitures).num (i) := car;
            i                                  := i + 1;
         end loop;
         New_Line;
         Get (fichier, place);
         New_Line;
         Get (fichier, time);
         p.voitures (p.nb_voitures).place       := place;
         p.voitures (p.nb_voitures).heureEntree := time;
      end loop;
      Close (fichier);
   end lire_parking_from_file;

end actions_parking;
