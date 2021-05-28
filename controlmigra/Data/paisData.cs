using controlmigra.Modelo;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace controlmigra.Data
{
    public class paisData
    {
        public static bool addpais(pais ntipdoc)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_regpais", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@nombre", ntipdoc.nombre);
                cmd.Parameters.AddWithValue("@iso", ntipdoc.iso);
                cmd.Parameters.AddWithValue("@iata", ntipdoc.iata);
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
        public static List<pais> listarPais()
        {
            List<pais> oListaUsuario = new List<pais>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_listarpais", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConexion.Open();
                    cmd.ExecuteNonQuery();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {

                        while (dr.Read())
                        {
                            oListaUsuario.Add(new pais()
                            {
                                id = Convert.ToInt32(dr["idPais"]),
                                nombre = dr["nombre"].ToString(),
                                iso = dr["iso"].ToString(),
                                iata = dr["iata"].ToString(),
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
        public static pais ObtenerpaisID(int idsubd)
        {
            pais ntipodoc = new pais();
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_lispaisid", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idtipod", idsubd);

                try
                {
                    oConexion.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {

                        while (dr.Read())
                        {
                            ntipodoc = new pais()
                            {

                                id = Convert.ToInt32(dr["idPais"]),
                                nombre = dr["nombre"].ToString(),
                                iso = dr["iso"].ToString(),
                                iata = dr["iata"].ToString(),
                                activo = dr["activo"].ToString(),
                                idUsuarioIng = Convert.ToInt32(dr["idUsuarioIng"]),
                                fechaIng = Convert.ToDateTime(dr["fechaIng"]),
                                idUsuarioAct = Convert.ToInt32(dr["idUsuarioAct"]),
                                fechaAct = Convert.ToDateTime(dr["fechaAct"]),

                            };
                        }

                    }



                    return ntipodoc;
                }
                catch (Exception ex)
                {
                    return ntipodoc;
                }
            }
        }
        public static bool editpais(pais ntipdoc)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("spedit_pais", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idtDoc", ntipdoc.id);
                cmd.Parameters.AddWithValue("@nombre", ntipdoc.nombre);
                cmd.Parameters.AddWithValue("@iso", ntipdoc.iso);
                cmd.Parameters.AddWithValue("@iata", ntipdoc.iata);
                cmd.Parameters.AddWithValue("@activo", ntipdoc.activo);
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
        public static bool delpais(int id)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_delpais", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idtDoc", id);

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
    }
}
