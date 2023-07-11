with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with voiture;             use voiture;

package body parking is

   --lit l'ensemble de voitures du parking p
   procedure remplir_parking (p : out Type_Parking) is
      i       : Integer;
      reponse : Character;
   begin
      i := 1;
      put("Introduissez une voiture! ");
      New_Line;
      lire_voiture (p.voitures (i));
      Put ("Si vous voulez continuer, tappez o ou O ");
      Get (reponse);
      i := i + 1;
      while (reponse = 'o' or reponse = 'O') and i <= NB_MAX loop
         lire_voiture (p.voitures (i));
         Put ("Si vous voulez continuer, tappez o ou O");
         Get (reponse);
         i := i + 1;
      end loop;
      p.nb_voitures := i - 1;
       if p.nb_voitures = 0 then
         put("Le parking est vide");
      end if;
      New_Line;
   end remplir_parking;

   --affiche toutes les informations des voitures stationnées dans le parking p
   procedure afficher_parking (p : in Type_Parking) is
      i : Integer; -- compteur pour le tableau
   begin

      if p.nb_voitures = 0 then
         put("Le parking est vide");
      else
      i := 1;
      while i <= p.nb_voitures loop
         New_Line;
         afficher_voiture (p.voitures (i));
         i := i + 1;
      end loop;
         New_Line;
          end if;
   end afficher_parking;

   -- recherche la voiture v
   procedure trouver_voiture
     (p    : in     Type_Parking; v : in Type_Voiture; res : out Boolean;
      rang :    out Integer)
   is
      i : Integer;
   begin
      if p.nb_voitures = 0 then
         put("Le parking est vide");
      end if;
      i    := 1;
      rang := 0;
      while i <= p.nb_voitures loop
         if egalite (p.voitures (i), v) = True then
            res  := True;
            rang := i;
         end if;
         i := i + 1;
      end loop;
      Put (" Le rang de la voiture : ");
      Put (rang);

   end trouver_voiture;

   -- insère une voiture v dans le parking p ; la voiture est insérée après la dernière voiture ajoutée
   procedure ajouter_voiture (p : in out Type_Parking) is
   begin
      lire_voiture (p.voitures (p.nb_voitures + 1));
      p.nb_voitures := p.nb_voitures + 1;
   end ajouter_voiture;

   -- insère une voiture v dans le parking p ; la voiture est insérée à la position pos
   procedure ajouter_voiture_pos (p : in out Type_Parking; v : in Type_Voiture)
   is
      pos : Integer;
      i   : Integer;
   begin
      Put
        ("Entrez la position à la quelle vous souhaitez introudire la voiture : ");
      Get (pos);
      i := p.nb_voitures;
      while (i >= pos) loop
         p.voitures (i + 1) := p.voitures (i);
         i                  := i - 1;
      end loop;
      p.voitures (pos) := v;
      p.nb_voitures    := p.nb_voitures + 1;
   end ajouter_voiture_pos;

   -- supprime la dernière voiture ajoutée au parking p
   procedure supprimer_voiture (p : in out Type_Parking) is
      i : Integer;
   begin
      if p.nb_voitures = 0 then
         put("Le parking est vide");
      end if;
      i := p.nb_voitures;
      while i < p.nb_voitures loop
         p.voitures (i) := p.voitures (i + 1);
         i              := i + 1;
      end loop;

      p.nb_voitures := p.nb_voitures - 1;
   end supprimer_voiture;

   -- supprime la dernière voiture ajoutée au parking p
   procedure supprimer_voiture_pos (p : in out Type_Parking) is
      i   : Integer;
      pos : Integer;
   begin
      if p.nb_voitures = 0 then
         put("Le parking est vide");
      end if;
      Put ("Entrez la position de la voiture à supprimer: ");
      Get (pos);
      i := pos;
      while i < p.nb_voitures loop
         p.voitures (i) := p.voitures (i + 1);
         i              := i + 1;
      end loop;
      p.nb_voitures := p.nb_voitures - 1;
   end supprimer_voiture_pos;

end parking;
