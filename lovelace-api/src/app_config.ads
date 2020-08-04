with GNATCOLL.JSON;         use GNATCOLL.JSON;

package App_Config is

      type Configuration is tagged private;

      function Access_Config (Config : in Configuration) return JSON_Value;

      procedure Acquire_Configuration (Config : in out Configuration);

private

      type Configuration is tagged record
            JSON : GNATCOLL.JSON.JSON_Value;
      end record;

end App_Config;
