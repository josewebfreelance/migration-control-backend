using controlmigra.Modelo;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace controlmigra.Data
{
    public class ocupacionData
    {
        public static bool Registrarocupa(ocupacion nocupacion)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_registrarocupacion", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@nombre", nocupacion.nombre);
                cmd.Parameters.AddWithValue("@activo", nocupacion.activo);
                cmd.Parameters.AddWithValue("@idUsuarioIng", nocupacion.idUsuarioIng);
                cmd.Parameters.AddWithValue("@fechaIng", nocupacion.fechaIng);
                cmd.Parameters.AddWithValue("@idUsuarioAct", nocupacion.idUsuarioAct);
                cmd.Parameters.AddWithValue("@fechaAct", nocupacion.fechaAct);

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
        public static List<ocupacion> Listarocupa()
        {
            List<ocupacion> oListaUsuario = new List<ocupacion>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_listarocupacion", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConexion.Open();
                    cmd.ExecuteNonQuery();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {

                        while (dr.Read())
                        {
                            oListaUsuario.Add(new ocupacion()
                            {
                                idocupacion = Convert.ToInt32(dr["idOcupacion"]),
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

        public static ocupacion Obtenerocupaid(int idocupacion)
        {
            ocupacion nocupacion = new ocupacion();
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_obtenerocupacionid", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idocupacion", idocupacion);

                try
                {
                    oConexion.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {

                        while (dr.Read())
                        {
                            nocupacion = new ocupacion()
                            {
                                idocupacion = Convert.ToInt32(dr["idOcupacion"]),
                                nombre = dr["nombre"].ToString(),
                                activo = dr["activo"].ToString(),
                                idUsuarioIng = Convert.ToInt32(dr["idUsuarioIng"]),
                                fechaIng = Convert.ToDateTime(dr["fechaIng"]),
                                idUsuarioAct = Convert.ToInt32(dr["idUsuarioAct"]),
                                fechaAct = Convert.ToDateTime(dr["fechaAct"]),
                            };
                        }

                    }



                    return nocupacion;
                }
                catch (Exception ex)
                {
                    return nocupacion;
                }
            }
        }

        public static bool Modificarocupa(ocupacion nocupacion)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_modificarocupacion", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idocupacion", nocupacion.idocupacion);
                cmd.Parameters.AddWithValue("@nombre", nocupacion.nombre);
                cmd.Parameters.AddWithValue("@activo", nocupacion.activo);
                cmd.Parameters.AddWithValue("@idUsuarioAct", nocupacion.idUsuarioAct);
                cmd.Parameters.AddWithValue("@fechaAct", nocupacion.fechaAct);

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

        public static bool Eliminarocupa(int id)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_eliminarocupacion", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idocupacion", id);

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

