using controlmigra.Data;
using controlmigra.Modelo;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace controlmigra.Controllers
{
    [ApiController]
    [Route("api/[action]/{id?}")]
    public class prechequeoController : ControllerBase
    {
        public List<prechequeo> listpreche()
        {
            return prechequeoData.Listprechequeo();
        }
    }
}
