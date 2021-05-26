using controlmigra.Data;
using controlmigra.Modelo;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace controlmigra.Controllers
{

    [ApiController]
    [Route("api/[action]/{id?}")]
    public class ocupacionController : Controller
    {
        public bool Registrarocupacion([FromBody] ocupacion nocupacion)
        {
            return ocupacionData.Registrarocupa(nocupacion);
        }
        public List<ocupacion> Listarocupacion()
        {
            return ocupacionData.Listarocupa();
        }
        public ocupacion Obtenerocupaid(int id)
        {
            return ocupacionData.Obtenerocupaid(id);
        }

        public bool Modificarocupa([FromBody] ocupacion nocupacion)
        {
            return ocupacionData.Modificarocupa(nocupacion);
        }
        public bool Eliminarocupacion(int id)
        {
            return ocupacionData.Eliminarocupa(id);
        }
    }
}
