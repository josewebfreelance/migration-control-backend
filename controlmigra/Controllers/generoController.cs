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
    public class generoController : Controller
    {
        public bool Registrargenero([FromBody] genero ngenero)
        {
            return generodata.Registrargen(ngenero);
        }
        public List<genero> Listargenero()
        {
            return generodata.Listargen();
        }
        public genero ObtenergenID(int id)
        {
            return generodata.Obtenergenid(id);
        }

        public bool ModificarGen([FromBody] genero ngenero)
        {
            return generodata.ModificarGen(ngenero);
        }
        public bool EliminarGenero(int id)
        {
            return generodata.Eliminargen(id);
        }
    }
}
