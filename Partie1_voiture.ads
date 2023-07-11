package voiture is

   --Definir le type de donnee CharArray comme un tableau de 9 caract`eres
   TAILLE_MAX : constant Integer := 9;
   type CharArray is array (1 .. TAILLE_MAX) of Character;

   -- Definir le type de donn´ee Type Voiture
   type Type_Voiture is record
      num         : CharArray; -- le numéro d'immatriculation
      place       : Integer; -- le numéro de place du parking
      heureEntree : Integer; -- l'heure d arrivée srokée en secondes
      heureEntree_h : Integer;
      heureEntree_m : Integer;
   end record;

   procedure lire_voiture (v : out Type_Voiture);

   procedure afficher_voiture (v : in Type_Voiture);

   function egalite (v1 : in Type_Voiture ; v2 : in Type_Voiture) return Boolean;

   function obtenir_matricule (v : in Type_Voiture) return CharArray;

   function obtenir_num_place (v : in Type_Voiture) return Integer;

   function calculer_duree_stationnement (v : in Type_Voiture) return Integer;

end voiture;
