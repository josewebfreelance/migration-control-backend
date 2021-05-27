using controlmigra.Modelo;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace controlmigra.Data
{
    public class subTipoDoctoData
    {
        public static bool addsubTipoDocto(subTipoDocto ntipdoc)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_registrar_subTipoDocto", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idTipoDocto", ntipdoc.idTipoDocto);
                cmd.Parameters.AddWithValue("@nombre", ntipdoc.nombre);
                cmd.Parameters.AddWithValue("@activo", ntipdoc.activo);
                cmd.Parameters.AddWithValue("@idUsuarioIng", ntipdoc.idUsuarioIng);
                cmd.Parameters.AddWithValue("@fechaIng", ntipdoc.fechaIng.Date);
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

        public static List<subTipoDocto> Listartipodocto()
        {
            List<subTipoDocto> oListaUsuario = new List<subTipoDocto>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_listarsubTipoDocto", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConexion.Open();
                    cmd.ExecuteNonQuery();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {

                        while (dr.Read())
                        {
                            oListaUsuario.Add(new subTipoDocto()
                            {
                                id = Convert.ToInt32(dr["idSubTipoDocto"]),
                                idTipoDocto = Convert.ToInt32(dr["idTipoDocto"]),
                                nombre = dr["nombre"].ToString(),
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
        public static subTipoDocto ObtenerSubtipodoscID(int idsubd)
        {
            subTipoDocto ntipodoc = new subTipoDocto();
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_listarsubTipoDoctoID", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idsubdoc", idsubd);

                try
                {
                    oConexion.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {

                        while (dr.Read())
                        {
                            ntipodoc = new subTipoDocto()
                            {
                                id = Convert.ToInt32(dr["idSubTipoDocto"]),
                                idTipoDocto = Convert.ToInt32(dr["idTipoDocto"]),
                                nombre = dr["nombre"].ToString(),
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

        public static bool editsubtipoD(subTipoDocto ntipdoc)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_editsubTipoDocto", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idtDoc", ntipdoc.id);
                cmd.Parameters.AddWithValue("@nombre", ntipdoc.nombre);
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

        public static bool delsubtipoDoc(int id)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_DELsubTipoDocto", oConexion);
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
