with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;
with voiture;             use voiture;
with parking;             use parking;
with actions_parking;     use actions_parking;

procedure menu is

   --Glossaire
   choice  : Integer; --Choix de l'utilisateur
   parking : Type_Parking;
   voiture : Type_Voiture;
   res     : Boolean;
   rang    : Integer;

--Sous programme boucle "jusqu'à ce que"---------------------------------------
   function factorielle (n : in Integer) return Integer is
      counter : Integer := n;
      result  : Integer := 1;
   begin

      loop
         result  := result * counter;
         counter := counter - 1;
         exit when counter = 0;
      end loop;

      return result;
   end factorielle;
   --------------------------------------------------------------------------------

begin
   loop
      New_Line;
      Put_Line ("[0] Remplissage du parking manuellement a partir du clavier");
      Put_Line ("[1] Affichage de la liste de voitures du parking");
      Put_Line ("[2] Trouver une voiture dans le parking");
      Put_Line ("[3] Ajouter une voiture dans le parking");
      Put_Line
        ("[4] Ajouter une voiture dans le parking dans une position donnee");
      Put_Line ("[5] Supprimer une voiture dans le parking");
      Put_Line
        ("[6] Supprimer une voiture dans le parking dans une position donnee");
      Put_Line ("[7] Calculer le nombre de places disponibles");
      Put_Line ("[8] Obtenir la voiture avec la plus longue duree");
      Put_Line ("[9] Obtenir la tarif pour une duree");
      Put_Line ("[10] Obtenir le numero de la place la plus grande");
      Put_Line ("[11] Quitter");
      New_Line;
      New_Line;
      Put ("Entrer votre choix ---> ");
      Get (choice);
      New_Line;
      Put ("> ");

      parking.nb_voitures := 0;

      case choice is
         when 0 =>
            remplir_parking (parking);
         when 1 =>
            afficher_parking (parking);
         when 2 =>
            trouver_voiture (parking, voiture, res, rang);
         when 3 =>
            ajouter_voiture (parking);
         when 4 =>
            ajouter_voiture_pos (parking, voiture);
         when 5 =>
            supprimer_voiture (parking);
         when 6 =>
            supprimer_voiture_pos (parking);
         when 7 =>
            Put (nb_places_disponibles (parking));
         when 8 =>
            afficher_voiture (obtenir_voiture_plus_longue_duree (parking));
         when 9 =>
            obtenir_tarif (parking, voiture);
         when 10 =>
            afficher_voiture (obtenir_voiture_plus_grand_num_place (parking));
         when 11 =>
            exit;
         when others =>
            Put ("Une erreur est survenue");
            exit;
      end case;
   end loop;

end menu;
