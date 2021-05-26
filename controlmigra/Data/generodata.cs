using controlmigra.Modelo;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace controlmigra.Data
{
    public class generodata
    {


        public static bool Registrargen(genero ngenero)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_registrargenero", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@nombre", ngenero.nombre);
                cmd.Parameters.AddWithValue("@activo", ngenero.activo);
                cmd.Parameters.AddWithValue("@idUsuarioIng", ngenero.idUsuarioIng);
                cmd.Parameters.AddWithValue("@fechaIng", ngenero.fechaIng);
                cmd.Parameters.AddWithValue("@idUsuarioAct", ngenero.idUsuarioAct);
                cmd.Parameters.AddWithValue("@fechaAct", ngenero.fechaAct);
               
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
        public static List<genero> Listargen()
        {
            List<genero> oListaUsuario = new List<genero>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_listargenero", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConexion.Open();
                    cmd.ExecuteNonQuery();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {

                        while (dr.Read())
                        {
                            oListaUsuario.Add(new genero()
                            {
                                idGenero = Convert.ToInt32(dr["idGenero"]),
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

        public static genero Obtenergenid(int idgenero)
        {
            genero ngenero = new genero();
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_obtenergenid", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idgenero", idgenero);

                try
                {
                    oConexion.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {

                        while (dr.Read())
                        {
                            ngenero = new genero()
                            {
                                idGenero = Convert.ToInt32(dr["idGenero"]),
                                nombre = dr["nombre"].ToString(),
                                activo = dr["activo"].ToString(),
                                idUsuarioIng = Convert.ToInt32(dr["idUsuarioIng"]),
                                fechaIng = Convert.ToDateTime(dr["fechaIng"]),
                                idUsuarioAct = Convert.ToInt32(dr["idUsuarioAct"]),
                                fechaAct = Convert.ToDateTime(dr["fechaAct"]),
                            };
                        }

                    }



                    return ngenero;
                }
                catch (Exception ex)
                {
                    return ngenero;
                }
            }
        }

        public static bool ModificarGen(genero ngenero)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_modificargenero", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idgenero", ngenero.idGenero);
                cmd.Parameters.AddWithValue("@nombre", ngenero.nombre);
                cmd.Parameters.AddWithValue("@activo", ngenero.activo);
                cmd.Parameters.AddWithValue("@idUsuarioAct", ngenero.idUsuarioAct);
               cmd.Parameters.AddWithValue("@fechaAct", ngenero.fechaAct);

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

        public static bool Eliminargen(int id)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_eliminargenero", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idgenero", id);

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
