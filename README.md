using System.Data.SqlClient;

namespace _5
{
    public partial class Form1 : Form
    {

        SqlConnection mysql;
        DataTable dt;

        public Form1()
        {
            InitializeComponent();
        }

        private void Fill_Grid()
        {
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from tblwy", mysql);
                DataSet ds = new DataSet();
                da.Fill(ds, "staff");
                dgData.DataSource = null;
                dgData.DataSource = ds.Tables["staff"];

                dt = ds.Tables["staff"];
            }
            catch (Exception er)
            {
                MessageBox.Show(er.ToString());
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            String sqlstr = "Data Source=DESKTOP-HD0E562;Initial Catalog=wy; User Id=sa, Password = ";
            mysql = new SqlConnection(sqlstr);
            mysql.Open();

            Fill_Grid();

        }

        private void dgData_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            DataRow dr = dt.Rows[dgData.CurrentRow.Index];
            txtn.Text = dr[0].ToString();
            txtsn.Text = dr[1].ToString();
            txta.Text = dr[2].ToString();
            txtp.Text = dr[3].ToString();

        }

        private void btnN_Click(object sender, EventArgs e)
        {
            txtn.Text = "";
            txtsn.Text = "";
            txta.Text = "";
            txtp.Text = "";
        }

        private void btnFind_Click(object sender, EventArgs e)
        {
            //Form2 f2 = new Form2();
            //f2.Show();
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                DialogResult result = MessageBox.Show("Hey!! You wanna save?", "Save", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (DialogResult.Yes == result)
                {
                    string query = "select * from tblwy where Staff Code='000'";
                    DataSet Dset = new DataSet();
                    SqlDataAdapter adapter = new SqlDataAdapter(query, mysql);
                    adapter.Fill(Dset, "Tay");

                    SqlCommandBuilder cb = new SqlCommandBuilder(adapter);
                    DataRow DRow = Dset.Tables["Tay"].NewRow();
                    DRow["Name"] = txtn.ToString();
                    DRow["StaffName"] = txtsn.ToString();
                    DRow["Position"] = txtp.ToString();
                    DRow["Address"] = txta.ToString();

                    Dset.Tables["Tay"].Rows.Add(DRow);
                    adapter.Update(Dset, "Tay");
                    MessageBox.Show("Finish Saving ", "Save", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    dt.Clear();
                    Fill_Grid();
                }
            }
            catch (Exception er) { MessageBox.Show(er.ToString()); }
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                DialogResult result = MessageBox.Show("Hey!! You wanna Delete", "Delete", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (DialogResult.Yes == result)
                {
                    SqlCommand delcom = new SqlCommand("Delete from tblwy where Staff Code='" + txtn.Text + "'", mysql);
                    int rows = delcom.ExecuteNonQuery();
                    MessageBox.Show(rows.ToString() + "Rows Deleted");
                    dt.Clear();
                    Fill_Grid();
                }
            }
            catch (Exception er) { MessageBox.Show(er.ToString()); }
        }

       
    }
}
