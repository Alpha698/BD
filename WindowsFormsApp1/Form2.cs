using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using MySql.Data.MySqlClient;
using System.Windows.Forms;

namespace WindowsFormsApp1
{
    public partial class Form2 : Form
    {
        MySqlConnection connection = new MySqlConnection("server=localhost;port=3306; Initial Catalog='tspp';username=root;password=;SslMode=none");

        public Form2()
        {
            InitializeComponent();
        }
        
        private void Form2_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            string predmet = textBox1.Text;
            string prepod = textBox2.Text;
            int aud = Convert.ToInt32(textBox3.Text);
            int etaj = Convert.ToInt32(textBox4.Text);
            int s = Convert.ToInt32(textBox5.Text);
            int don = Convert.ToInt32(textBox6.Text);
            string facult = textBox7.Text;
            string spets = textBox8.Text;
            int group = Convert.ToInt32( textBox9.Text); 
            bool status = checkBox1.Checked;
            int numpar = Convert.ToInt32(textBox10.Text);

            int st ;

            if (status == true) { st = 1; } else st = 0;


            connection.Open(); //Устанавливаем соединение с базой данных.
            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = connection;
            cmd.CommandText = "INSERT INTO rasp(predmet, nomer_paru, nomer_aud, nedstart, nedend, fakult, nomer_group, FIO_prep, Spets, etaj, status) VALUES ('" + predmet + "','" + numpar+ "','" + aud + "','" + s + "','" + don + "','" + facult + "','" + group + "','" + prepod + "','" + spets +  "','"+etaj+ "','"+st+"')";
            cmd.ExecuteNonQuery();

            
           
            
        }

        private void button2_Click(object sender, EventArgs e)
        {
            
            int id = Convert.ToInt32(textBox11.Text);

            connection.Open(); //Устанавливаем соединение с базой данных.
            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = connection;
            cmd.CommandText = "DELETE FROM rasp WHERE id ='"+id+"'";
            cmd.ExecuteNonQuery(); 

        }

        private void label12_Click(object sender, EventArgs e)
        {

        }
    }
}
