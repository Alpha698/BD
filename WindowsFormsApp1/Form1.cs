﻿using System;
using MySql.Data.MySqlClient;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Collections;
using System.Data.OleDb;

namespace WindowsFormsApp1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        MySqlConnection connection = new MySqlConnection("server=localhost;port=3306; Initial Catalog='kyrs_db';username=root;password=;SslMode=none");
        private void Form1_Load(object sender, EventArgs e)
        {
            string selectQuery5 = @"Select DataPar.denNedeli, DataPar.nomerPary, Zanatie.nazvanie, Prepodavateli.FIOpr, Auditorya.nomer, Grypa.name, DataPar.nedStart, DataPar.nedEnd 
                                    from Raspis 
                                    inner join DataPar on DataPar.id_data = Raspis.id_data 
                                    inner join Zanatie on Zanatie.id_Zanatia = Raspis.id_Zanatia 
                                    inner join Prepodavateli on Prepodavateli.id_Prep = Raspis.id_Prep 
                                    inner join Auditorya on Auditorya.id_Aud = Raspis.id_Aud 
                                    inner join Grypa on Grypa.id_gr = Raspis.id_gr ";

            DataTable table = new DataTable();
            MySqlDataAdapter adapter = new MySqlDataAdapter(selectQuery5, connection);
            adapter.Fill(table);
            dataGridView4.DataSource = table;

            string selectQuery6 = "Select * from Auditorya";
            DataTable tableay = new DataTable();
            MySqlDataAdapter adapteray = new MySqlDataAdapter(selectQuery6, connection);
            adapteray.Fill(tableay);
            dataGridView3.DataSource = tableay;
            //////////////////////////////////////////////////Для выбора своб аудитории////////////
            string selectQuery9 = "Select DISTINCT denNedeli from DataPar";
            MySqlDataAdapter da9 = new MySqlDataAdapter(selectQuery9, connection);
            DataSet ds9 = new DataSet();
            da9.Fill(ds9);
            comboBox4.DataSource = ds9.Tables[0];
            comboBox4.DisplayMember = "id_data";
            comboBox4.ValueMember = "denNedeli";

            string selectQuery10 = "Select DISTINCT nomerPary from DataPar";
            MySqlDataAdapter da10 = new MySqlDataAdapter(selectQuery10, connection);
            DataSet ds10 = new DataSet();
            da10.Fill(ds10);
            comboBox5.DataSource = ds10.Tables[0];
            comboBox5.DisplayMember = "id_data";
            comboBox5.ValueMember = "nomerPary";

            ///////////////////////////////////////////////Для добавления и удаления и изменения////////////
            string selectQuery7 = "Select DISTINCT korpys from Auditorya";
            MySqlDataAdapter da = new MySqlDataAdapter(selectQuery7, connection);
            DataSet ds = new DataSet();
            da.Fill(ds);
            comboBox2.DataSource = ds.Tables[0];
            comboBox2.DisplayMember = "id_Aud";
            comboBox2.ValueMember = "korpys";

            string selectQuery8 = "Select DISTINCT nomer from Auditorya";
            MySqlDataAdapter da12 = new MySqlDataAdapter(selectQuery8, connection);
            DataSet ds12 = new DataSet();
            da12.Fill(ds12);
            comboBox12.DataSource = ds12.Tables[0];
            comboBox12.DisplayMember = "id_Aud";
            comboBox12.ValueMember = "nomer";

            string selectQuery71 = "Select DISTINCT korpys from Auditorya";
            MySqlDataAdapter da3 = new MySqlDataAdapter(selectQuery71, connection);
            DataSet ds3 = new DataSet();
            da3.Fill(ds3);
            comboBox1.DataSource = ds3.Tables[0];
            comboBox1.DisplayMember = "id_Aud";
            comboBox1.ValueMember = "korpys";
            /////////////////////////////////////////// Для добавления занятия////////////////////

            string selectQuery21 = "Select DISTINCT denNedeli from DataPar";
            MySqlDataAdapter da21 = new MySqlDataAdapter(selectQuery21, connection);
            DataSet ds21 = new DataSet();
            da21.Fill(ds21);
            comboBox7.DataSource = ds21.Tables[0];
            comboBox7.DisplayMember = "id_data";
            comboBox7.ValueMember = "denNedeli";

            string selectQuery22 = "Select DISTINCT nomerPary from DataPar";
            MySqlDataAdapter da22 = new MySqlDataAdapter(selectQuery22, connection);
            DataSet ds22 = new DataSet();
            da22.Fill(ds22);
            comboBox8.DataSource = ds22.Tables[0];
            comboBox8.DisplayMember = "id_data";
            comboBox8.ValueMember = "nomerPary";

            //string selectQuery25 = "Select DISTINCT nedStart from DataPar";
            //MySqlDataAdapter da25 = new MySqlDataAdapter(selectQuery25, connection);
            //DataSet ds25 = new DataSet();
            //da25.Fill(ds25);
            //comboBox9.DataSource = ds25.Tables[0];
            //comboBox9.DisplayMember = "id_data";
            //comboBox9.ValueMember = "nedStart";

            //string selectQuery26 = "Select DISTINCT nedEnd from DataPar";
            //MySqlDataAdapter da26 = new MySqlDataAdapter(selectQuery26, connection);
            //DataSet ds26 = new DataSet();
            //da26.Fill(ds26);
            //comboBox13.DataSource = ds26.Tables[0];
            //comboBox13.DisplayMember = "id_data";
            //comboBox13.ValueMember = "nedEnd";

            string selectQuery23 = "Select DISTINCT nomer from Auditorya";
            MySqlDataAdapter da23 = new MySqlDataAdapter(selectQuery23, connection);
            DataSet ds23 = new DataSet();
            da23.Fill(ds23);
            comboBox11.DataSource = ds23.Tables[0];
            comboBox11.DisplayMember = "id_Aud";
            comboBox11.ValueMember = "nomer";

            string selectQuery24 = "Select DISTINCT FIOpr from Prepodavateli";
            MySqlDataAdapter da24 = new MySqlDataAdapter(selectQuery24, connection);
            DataSet ds24 = new DataSet();
            da24.Fill(ds24);
            comboBox3.DataSource = ds24.Tables[0];
            comboBox3.DisplayMember = "id_Prep";
            comboBox3.ValueMember = "FIOpr";

            string selectQuery27 = "Select DISTINCT name from Grypa";
            MySqlDataAdapter da27 = new MySqlDataAdapter(selectQuery27, connection);
            DataSet ds27 = new DataSet();
            da27.Fill(ds27);
            comboBox10.DataSource = ds27.Tables[0];
            comboBox10.DisplayMember = "id_gr";
            comboBox10.ValueMember = "name";

            string selectQuery28 = "Select nazvanie from Zanatie";
            MySqlDataAdapter da28 = new MySqlDataAdapter(selectQuery28, connection);
            DataSet ds28 = new DataSet();
            da28.Fill(ds28);
            comboBox14.DataSource = ds28.Tables[0];
            comboBox14.DisplayMember = "id_Zanatia";
            comboBox14.ValueMember = "nazvanie";

            string selectQuery29 = "Select  kafedra from Napravlenie";
            MySqlDataAdapter da29 = new MySqlDataAdapter(selectQuery29, connection);
            DataSet ds29 = new DataSet();
            da29.Fill(ds29);
            comboBox15.DataSource = ds29.Tables[0];
            comboBox15.DisplayMember = "id_nap";
            comboBox15.ValueMember = "kafedra";

        }//Подгрузка при запуске

        private void button5_Click(object sender, EventArgs e)
        {

            string denned = Convert.ToString(comboBox4.Items[comboBox4.SelectedIndex]);
            string nompar = Convert.ToString(comboBox5.Items[comboBox5.SelectedIndex]);
            string ned = Convert.ToString(comboBox6.Items[comboBox6.SelectedIndex]);

            if (denned != null && nompar != null && ned != null)
            {
                string selectQuery7 = @"Select DISTINCT Auditorya.id_Aud, Auditorya.nomer,Auditorya.korpys from Raspis 
inner join DataPar on DataPar.id_data = Raspis.id_data
inner join Auditorya on Auditorya.id_Aud = Raspis.id_Aud WHERE Auditorya.id_Aud NOT IN (Select Auditorya.id_Aud from Raspis 
inner join DataPar on DataPar.id_data = Raspis.id_data
 inner join Auditorya on Auditorya.id_Aud = Raspis.id_Aud
where DataPar.denNedeli = '" + denned + "' and DataPar.nomerPary = '" + nompar + "' and '" + ned + "' between DataPar.nedStart and DataPar.nedEnd)";
                //where DataPar.denNedeli = '" + denned + "' and DataPar.nomerPary = '" + nompar + "'";
                DataTable tableay1 = new DataTable();
                MySqlDataAdapter adapteray1 = new MySqlDataAdapter(selectQuery7, connection);
                adapteray1.Fill(tableay1);
                dataGridView5.DataSource = tableay1;
            }

        }//Поиск свободных аудиторий

        private void button4_Click(object sender, EventArgs e)
        {
            Application.Restart();
        }//Перезагрузить приложение

        private void button3_Click(object sender, EventArgs e)
        {            

            int nomayd = Convert.ToInt32(textBox5.Text);
            int kolvom = Convert.ToInt32(textBox6.Text);
           // string korpys = Convert.ToString(comboBox2.Items[comboBox2.SelectedIndex]);
            string dept = comboBox2.Text;
            //int etaj = Convert.ToInt32(textBox4.Text);
            //int don = Convert.ToInt32(textBox6.Text);
            //string facult = textBox7.Text;
            //string spets = textBox8.Text;
            //int group = Convert.ToInt32(textBox9.Text);
            //bool status = checkBox1.Checked;

            string selectQuery13 = "INSERT INTO Auditorya(nomer, kolvoMest, korpys) VALUES ('" + nomayd + "','" + kolvom + "','" + dept + "')";
            MySqlCommand da13 = new MySqlCommand(selectQuery13, connection);
            connection.Open();
            da13.ExecuteNonQuery();
            MessageBox.Show("Данные добавлены!");
        }//Добавить аудиторию

        private void button6_Click(object sender, EventArgs e)
        {
            string yda = comboBox12.Text;

            string selectQuery14 = "DELETE FROM Auditorya where Auditorya.nomer = '" + yda + "'";
            MySqlCommand da13 = new MySqlCommand(selectQuery14, connection);
            connection.Open();
            da13.ExecuteNonQuery();
            MessageBox.Show("Аудитория удалена!");
        }//Удалить аудиторию

        private void button7_Click(object sender, EventArgs e)
        {
            int nomayd2 = Convert.ToInt32(textBox4.Text);
            int kolvom2 = Convert.ToInt32(textBox3.Text);
            int aidi = Convert.ToInt32(textBox7.Text);
            string dept = comboBox1.Text;


            string selectQuery13 = "UPDATE Auditorya SET nomer='" + nomayd2 + "', kolvoMest='" + kolvom2 + "', korpys='" + comboBox1.SelectedValue.ToString() + "' WHERE id_Aud='"+ aidi +"'";
            MySqlCommand da13 = new MySqlCommand(selectQuery13, connection);
            connection.Open();
            da13.ExecuteNonQuery();
            MessageBox.Show("Данные изменены!");
        }//Изменение аудитории

        private void button1_Click(object sender, EventArgs e)
        {
            string denned = Convert.ToString(comboBox7.Items[comboBox7.SelectedIndex]);
            string nompar = Convert.ToString(comboBox8.Items[comboBox8.SelectedIndex]);
           // string denned = Convert.ToString(textBox3.Text);
           // int nompar = Convert.ToInt32(textBox4.Text);

            int nachned = Convert.ToInt32(textBox1.Text);
            int konned = Convert.ToInt32(textBox2.Text);

            string nomay = Convert.ToString(comboBox11.Items[comboBox11.SelectedIndex]);

            string gryp = Convert.ToString(comboBox10.Items[comboBox10.SelectedIndex]);
            string prep = Convert.ToString(comboBox3.Items[comboBox3.SelectedIndex]);
            string zan = Convert.ToString(comboBox14.Items[comboBox14.SelectedIndex]);
            string kaf = Convert.ToString(comboBox15.Items[comboBox15.SelectedIndex]);

            //добавление даты в таблицу дат
            string selectQuery13 = "INSERT INTO DataPar(denNedeli, nomerPary, nedStart, nedEnd) VALUES ('" + comboBox7.SelectedValue.ToString() + "','" + comboBox8.SelectedValue.ToString() + "','" + nachned + "','" + konned + "')";
            MySqlCommand da13 = new MySqlCommand(selectQuery13, connection);
           connection.Open();
            da13.ExecuteNonQuery();
            //MessageBox.Show("Данные добавлены!");

            //вывод даты если совпало с выбраными
            string selectQuery140 = "Select DISTINCT id_data from DataPar where denNedeli='" + comboBox7.SelectedValue.ToString() + "' and nomerPary='" + comboBox8.SelectedValue.ToString() + "' and nedStart='" + nachned + "' and nedEnd ='" + konned + "'";
            MySqlCommand da140 = new MySqlCommand(selectQuery140, connection);
            da140.ExecuteNonQuery();
            string name140 = da140.ExecuteScalar().ToString();


            //предмет
            string selectQuery141 = "Select DISTINCT id_Zanatia from Zanatie where Zanatie.nazvanie='" + comboBox14.SelectedValue.ToString() + "'";
            MySqlCommand da141 = new MySqlCommand(selectQuery141, connection);
            da141.ExecuteNonQuery();
            string name141 = da141.ExecuteScalar().ToString();


            //препод
            string selectQuery142 = "Select DISTINCT id_Prep from Prepodavateli where Prepodavateli.FIOpr='" + comboBox3.SelectedValue.ToString() + "'";
            MySqlCommand da142 = new MySqlCommand(selectQuery142, connection);
            da142.ExecuteNonQuery();
            string name142 = da142.ExecuteScalar().ToString();


            //аудитория
            string selectQuery143 = "Select DISTINCT id_Aud from Auditorya where  Auditorya.nomer='" + comboBox11.SelectedValue.ToString() + "'";
            MySqlCommand da143 = new MySqlCommand(selectQuery143, connection);
            da143.ExecuteNonQuery();
            string name143 = da143.ExecuteScalar().ToString();


            //группа
            string selectQuery144 = "Select DISTINCT id_gr from Grypa where Grypa.name='" + comboBox10.SelectedValue.ToString() + "'";
            MySqlCommand da144 = new MySqlCommand(selectQuery144, connection);
            da144.ExecuteNonQuery();
            string name144 = da144.ExecuteScalar().ToString();


            //направление
            string selectQuery145 = "Select DISTINCT id_nap from Napravlenie where Napravlenie.kafedra='" + comboBox15.SelectedValue.ToString() + "' ";
            MySqlCommand da145 = new MySqlCommand(selectQuery145, connection);
            da145.ExecuteNonQuery();
            string name145 = da145.ExecuteScalar().ToString();
            //MessageBox.Show(name);

            string selectQuery15 = "INSERT INTO Raspis(id_data, id_Zanatia, id_Prep, id_Aud, id_gr, id_nap) VALUES ('" + name140 + "','" + name141 + "','" + name142 + "','" + name143 + "','" + name144 + "','" + name145 + "')";
            MySqlCommand da14 = new MySqlCommand(selectQuery15, connection);
            //connection.Open();
            da14.ExecuteNonQuery();
            MessageBox.Show("Занятие добавлено!");
            
        }//Добавить занятие

    }
}



//Добавить таблицы:
//
// 
