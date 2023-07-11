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
      lire_voiture (p.voitures (i));
      Put ("Voulez-vous continuer?");
      Get (reponse);
      i := i + 1;
      while (reponse = 'o' or reponse = 'O') and i <= NB_MAX loop
         lire_voiture (p.voitures (i));
         Put ("Voulez-vous continuer?");
         Get (reponse);
         i := i + 1;
      end loop;
      p.nb_voitures := i - 1;
   end remplir_parking;

   --affiche toutes les informations des voitures stationn�es dans le parking p
   procedure afficher_parking (p : in Type_Parking) is
      i : Integer; -- compteur pour le tableau
   begin
      i := 1;
      while i <= p.nb_voitures loop
         afficher_voiture (p.voitures (i));
         i := i + 1;
      end loop;
      New_Line;
   end afficher_parking;

   -- recherche la voiture v
   procedure trouver_voiture
     (p    : in     Type_Parking; v : in Type_Voiture; res : out Boolean;
      rang :    out Integer)
   is
      i : Integer;
   begin
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

   -- ins�re une voiture v dans le parking p ; la voiture est ins�r�e apr�s la derni�re voiture ajout�e
   procedure ajouter_voiture (p : in out Type_Parking) is
   begin
      lire_voiture (p.voitures (p.nb_voitures + 1));
      p.nb_voitures := p.nb_voitures + 1;
   end ajouter_voiture;

   -- ins�re une voiture v dans le parking p ; la voiture est ins�r�e � la position pos
   procedure ajouter_voiture_pos (p : in out Type_Parking; v : in Type_Voiture)
   is
      pos : Integer;
      i   : Integer;
   begin
      Put
        ("Entrez la position � la quelle vous souhaitez introudire la voiture : ");
      Get (pos);
      i := p.nb_voitures;
      while (i >= pos) loop
         p.voitures (i + 1) := p.voitures (i);
         i                  := i - 1;
      end loop;
      p.voitures (pos) := v;
      p.nb_voitures    := p.nb_voitures + 1;
   end ajouter_voiture_pos;

   -- supprime la derni�re voiture ajout�e au parking p
   procedure supprimer_voiture (p : in out Type_Parking) is
      i : Integer;
   begin
      i := p.nb_voitures;
      while i < p.nb_voitures loop
         p.voitures (i) := p.voitures (i + 1);
         i              := i + 1;
      end loop;

      p.nb_voitures := p.nb_voitures - 1;
   end supprimer_voiture;

   -- supprime la derni�re voiture ajout�e au parking p
   procedure supprimer_voiture_pos (p : in out Type_Parking) is
      i   : Integer;
      pos : Integer;
   begin
      Put ("Entrez la position de la voiture � supprimer: ");
      Get (pos);
      i := pos;
      while i < p.nb_voitures loop
         p.voitures (i) := p.voitures (i + 1);
         i              := i + 1;
      end loop;
      p.nb_voitures := p.nb_voitures - 1;
   end supprimer_voiture_pos;

end parking;
