
namespace az204_cache {
    using StackExchange.Redis;
    using System.Threading.Tasks;

    class Program 
    {
        static string connectionString = "REDIS_CONNECTION_STRING";

        static async Task Main(string[] args) 
        {
            using(var cache = ConnectionMultiplexer.Connect(connectionString))
            {
                IDatabase db =cache.GetDatabase();

                var result = await db.ExecuteAsync("ping");
                Console.WriteLine($"PING = {result.Type} : {result}");

                bool setValue = await db.StringSetAsync("test:key", "100");
                Console.WriteLine($"SET: {setValue}");

                string getValue = await db.StringGetAsync("test:key");
                Console.WriteLine($"GET: {getValue}");
            }
        }
    }
}
