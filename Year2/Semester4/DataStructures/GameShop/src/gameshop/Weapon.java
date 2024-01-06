package gameshop;

/**
 *
 * @author Edward Entecott
 * 101190443
 * April 10th, 2020
 */

class Weapon
    {
        public String weaponName;
        public int range;
        public int damage;
        public double weight;
        public double cost;

        public Weapon(String n, int rang, int dam, double w, double c)
        {
            weaponName = n;
            damage = dam;
            range = rang;
            weight = w;
            cost = c;
        }
    }
