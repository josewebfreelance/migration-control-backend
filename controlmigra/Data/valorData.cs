using controlmigra.Modelo;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace controlmigra.Data
{
    public class valorData
    {
        public static bool addvalor(valor ntipdoc)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_addval", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@idPrechequeo", ntipdoc.idPrechequeo);
                cmd.Parameters.AddWithValue("@idTipoValor", ntipdoc.idTipoValor);
                cmd.Parameters.AddWithValue("@idTipoMoneda", ntipdoc.idTipoMoneda);
                cmd.Parameters.AddWithValue("@idTipoTitulo", ntipdoc.idTipoTitulo);
                cmd.Parameters.AddWithValue("@idTipoArticulo", ntipdoc.idTipoArticulo);
                cmd.Parameters.AddWithValue("@valor", ntipdoc.valor1);
                cmd.Parameters.AddWithValue("@idOrigenFondos", ntipdoc.idOrigenFondos);
                cmd.Parameters.AddWithValue("@activo", ntipdoc.activo);
                cmd.Parameters.AddWithValue("@idUsuarioIng", ntipdoc.idUsuarioIng);
                cmd.Parameters.AddWithValue("@fechaIng", ntipdoc.fechaIng);
                cmd.Parameters.AddWithValue("@idUsuarioAct", ntipdoc.idUsuarioAct);
                cmd.Parameters.AddWithValue("@fechaAct", ntipdoc.fechaAct);
                

                try
                {
                    oConexion.Open();
                    cmd.ExecuteNonQuery();
                    return true;
                }
                catch (Exception ex)
                {
                    return false;
                }

            }
        }

        public static List<valor> Listval()
        {
            List<valor> oListaUsuario = new List<valor>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_listaval", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConexion.Open();
                    cmd.ExecuteNonQuery();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {

                        while (dr.Read())
                        {
                            oListaUsuario.Add(new valor()
                            {
                                idValor = Convert.ToInt32(dr["idValor"]),
                                idPrechequeo = Convert.ToInt32(dr["idPrechequeo"]),
                                idTipoValor = Convert.ToInt32(dr["idTipoValor"]),
                                idTipoMoneda = Convert.ToInt32(dr["idTipoMoneda"]),
                                idTipoTitulo = Convert.ToInt32(dr["idTipoTitulo"]),
                                idTipoArticulo = Convert.ToInt32(dr["idTipoArticulo"]),
                                valor1 = Convert.ToDecimal(dr["valor"]),
                                idOrigenFondos = Convert.ToInt32(dr["idOrigenFondos"]),
                                activo = dr["activo"].ToString(),
                                idUsuarioIng = Convert.ToInt32(dr["idUsuarioIng"]),
                                fechaIng = Convert.ToDateTime(dr["fechaIng"]),
                                idUsuarioAct = Convert.ToInt32(dr["idUsuarioAct"]),
                                fechaAct = Convert.ToDateTime(dr["fechaAct"]),



                            });
                        }

                    }



                    return oListaUsuario;
                }
                catch (Exception ex)
                {
                    return oListaUsuario;
                }
            }
        }
    }
}
