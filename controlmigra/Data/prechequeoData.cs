using controlmigra.Modelo;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace controlmigra.Data
{


   
    public class prechequeoData
    {

        public static bool addprechec(prechequeo ntipdoc)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_addprechequeo", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
               
                cmd.Parameters.AddWithValue("@idDoctoPersona", ntipdoc.idDoctoPersona);
                cmd.Parameters.AddWithValue("@codigo", ntipdoc.codigo);
                cmd.Parameters.AddWithValue("@fecha", ntipdoc.fecha);
                cmd.Parameters.AddWithValue("@idDelegacion", ntipdoc.idDelegacion);
                cmd.Parameters.AddWithValue("@idTipoMovimiento", ntipdoc.idTipoMovimiento);
                cmd.Parameters.AddWithValue("@fechaLlegada", ntipdoc.fechaLlegada);
                cmd.Parameters.AddWithValue("@fechaSalida", ntipdoc.fechaSalida);
                cmd.Parameters.AddWithValue("@idTipoViaje", ntipdoc.idTipoViaje);
                cmd.Parameters.AddWithValue("@idRuta", ntipdoc.idRuta);
                cmd.Parameters.AddWithValue("@idPaisOrigen", ntipdoc.idPaisOrigen);
                cmd.Parameters.AddWithValue("@idPaisDestino", ntipdoc.idPaisDestino);
                cmd.Parameters.AddWithValue("@placaVehiculo", ntipdoc.placaVehiculo);
                cmd.Parameters.AddWithValue("@dineroMayorLimite", ntipdoc.dineroMayorLimite);
                cmd.Parameters.AddWithValue("@autorizaCompartir", ntipdoc.autorizaCompartir);
                cmd.Parameters.AddWithValue("@aurtorizaVerificar", ntipdoc.aurtorizaVerificar);
                cmd.Parameters.AddWithValue("@idLimiteDinero", ntipdoc.idLimiteDinero);
                cmd.Parameters.AddWithValue("@llaveCifrada", ntipdoc.llaveCifrada);
                cmd.Parameters.AddWithValue("@qr", ntipdoc.qr);
                cmd.Parameters.AddWithValue("@ip", ntipdoc.ip);
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

        public static List<prechequeo> Listprechequeo()
        {
            List<prechequeo> oListaUsuario = new List<prechequeo>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_lisPrechequeo", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConexion.Open();
                    cmd.ExecuteNonQuery();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {

                        while (dr.Read())
                        {
                            oListaUsuario.Add(new prechequeo()
                            {
                                idPrechequeo = Convert.ToInt32(dr["idPrechequeo"]),
                                idDoctoPersona = Convert.ToInt32 (dr["idDoctoPersona"]),
                                codigo = dr["codigo"].ToString(),
                                fecha = Convert.ToDateTime(dr["fecha"]),
                                idDelegacion = Convert.ToInt32(dr["idDelegacion"]),
                                idTipoMovimiento = Convert.ToInt32(dr["idTipoMovimiento"]),
                                fechaLlegada = Convert.ToDateTime(dr["fechaLlegada"]),
                                fechaSalida = Convert.ToDateTime(dr["fechaSalida"]),
                                idTipoViaje = Convert.ToInt32(dr["idTipoViaje"]),
                                idRuta = Convert.ToInt32(dr["idRuta"]),
                                idPaisOrigen = Convert.ToInt32(dr["idPaisOrigen"]),
                                idPaisDestino = Convert.ToInt32(dr["idPaisDestino"]),
                                placaVehiculo = dr["placaVehiculo"].ToString(),
                                dineroMayorLimite = dr["dineroMayorLimite"].ToString(),
                                autorizaCompartir = dr["autorizaCompartir"].ToString(),
                                aurtorizaVerificar = dr["aurtorizaVerificar"].ToString(),
                                idLimiteDinero = Convert.ToInt32(dr["idLimiteDinero"]),
                                llaveCifrada = dr["llaveCifrada"].ToString(),
                                qr = dr["qr"].ToString(),
                                ip = dr["ip"].ToString(),
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

        public static prechequeo obtenerpreID(int idsubd)
        {
            prechequeo ntipodoc = new prechequeo();
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_obtenerpreID", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idprec", idsubd);

                try
                {
                    oConexion.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {

                        while (dr.Read())
                        {
                            ntipodoc = new prechequeo()
                            {

                                idPrechequeo = Convert.ToInt32(dr["idPrechequeo"]),
                                idDoctoPersona = Convert.ToInt32(dr["idDoctoPersona"]),
                                codigo = dr["codigo"].ToString(),
                                fecha = Convert.ToDateTime(dr["fecha"]),
                                idDelegacion = Convert.ToInt32(dr["idDelegacion"]),
                                idTipoMovimiento = Convert.ToInt32(dr["idTipoMovimiento"]),
                                fechaLlegada = Convert.ToDateTime(dr["fechaLlegada"]),
                                fechaSalida = Convert.ToDateTime(dr["fechaSalida"]),
                                idTipoViaje = Convert.ToInt32(dr["idTipoViaje"]),
                                idRuta = Convert.ToInt32(dr["idRuta"]),
                                idPaisOrigen = Convert.ToInt32(dr["idPaisOrigen"]),
                                idPaisDestino = Convert.ToInt32(dr["idPaisDestino"]),
                                placaVehiculo = dr["placaVehiculo"].ToString(),
                                dineroMayorLimite = dr["dineroMayorLimite"].ToString(),
                                autorizaCompartir = dr["autorizaCompartir"].ToString(),
                                aurtorizaVerificar = dr["aurtorizaVerificar"].ToString(),
                                idLimiteDinero = Convert.ToInt32(dr["idLimiteDinero"]),
                                llaveCifrada = dr["llaveCifrada"].ToString(),
                                qr = dr["qr"].ToString(),
                                ip = dr["ip"].ToString(),
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
        public static bool editprec(prechequeo ntipdoc)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_editprec", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idprec", ntipdoc.idPrechequeo);
                cmd.Parameters.AddWithValue("@codigo", ntipdoc.codigo);
                cmd.Parameters.AddWithValue("@fecha", ntipdoc.fecha);
                cmd.Parameters.AddWithValue("@fechaLlegada", ntipdoc.fechaLlegada);
                cmd.Parameters.AddWithValue("@fechaSalida", ntipdoc.fechaSalida);
                cmd.Parameters.AddWithValue("@idTipoViaje", ntipdoc.idTipoViaje);
                cmd.Parameters.AddWithValue("@idRuta", ntipdoc.idRuta);
                cmd.Parameters.AddWithValue("@idPaisOrigen", ntipdoc.idPaisOrigen);
                cmd.Parameters.AddWithValue("@idPaisDestino", ntipdoc.idPaisDestino);
                cmd.Parameters.AddWithValue("@placaVehiculo", ntipdoc.placaVehiculo);
                cmd.Parameters.AddWithValue("@dineroMayorLimite", ntipdoc.dineroMayorLimite);
                cmd.Parameters.AddWithValue("@autorizaCompartir", ntipdoc.autorizaCompartir);
                cmd.Parameters.AddWithValue("@aurtorizaVerificar", ntipdoc.aurtorizaVerificar);
                cmd.Parameters.AddWithValue("@llaveCifrada", ntipdoc.llaveCifrada);
                cmd.Parameters.AddWithValue("@qr", ntipdoc.qr);
                cmd.Parameters.AddWithValue("@ip", ntipdoc.ip);
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
        public static bool delprec(int id)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_deleteprec", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idprec", id);

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
