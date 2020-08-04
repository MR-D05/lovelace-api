pragma Ada_95;
pragma Warnings (Off);
pragma Source_File_Name (ada_main, Spec_File_Name => "b__single_thread_server.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__single_thread_server.adb");
pragma Suppress (Overflow_Check);
with Ada.Exceptions;

package body ada_main is

   E126 : Short_Integer; pragma Import (Ada, E126, "system__os_lib_E");
   E011 : Short_Integer; pragma Import (Ada, E011, "system__soft_links_E");
   E021 : Short_Integer; pragma Import (Ada, E021, "system__exception_table_E");
   E186 : Short_Integer; pragma Import (Ada, E186, "ada__containers_E");
   E084 : Short_Integer; pragma Import (Ada, E084, "ada__io_exceptions_E");
   E049 : Short_Integer; pragma Import (Ada, E049, "ada__strings_E");
   E051 : Short_Integer; pragma Import (Ada, E051, "ada__strings__maps_E");
   E055 : Short_Integer; pragma Import (Ada, E055, "ada__strings__maps__constants_E");
   E088 : Short_Integer; pragma Import (Ada, E088, "ada__tags_E");
   E086 : Short_Integer; pragma Import (Ada, E086, "ada__streams_E");
   E039 : Short_Integer; pragma Import (Ada, E039, "interfaces__c_E");
   E236 : Short_Integer; pragma Import (Ada, E236, "interfaces__c__strings_E");
   E023 : Short_Integer; pragma Import (Ada, E023, "system__exceptions_E");
   E129 : Short_Integer; pragma Import (Ada, E129, "system__file_control_block_E");
   E117 : Short_Integer; pragma Import (Ada, E117, "ada__streams__stream_io_E");
   E121 : Short_Integer; pragma Import (Ada, E121, "system__file_io_E");
   E124 : Short_Integer; pragma Import (Ada, E124, "system__finalization_root_E");
   E122 : Short_Integer; pragma Import (Ada, E122, "ada__finalization_E");
   E139 : Short_Integer; pragma Import (Ada, E139, "system__storage_pools_E");
   E137 : Short_Integer; pragma Import (Ada, E137, "system__finalization_masters_E");
   E135 : Short_Integer; pragma Import (Ada, E135, "system__storage_pools__subpools_E");
   E224 : Short_Integer; pragma Import (Ada, E224, "ada__calendar_E");
   E222 : Short_Integer; pragma Import (Ada, E222, "ada__calendar__delays_E");
   E210 : Short_Integer; pragma Import (Ada, E210, "gnat__secure_hashes_E");
   E212 : Short_Integer; pragma Import (Ada, E212, "gnat__secure_hashes__sha1_E");
   E208 : Short_Integer; pragma Import (Ada, E208, "gnat__sha1_E");
   E103 : Short_Integer; pragma Import (Ada, E103, "system__assertions_E");
   E063 : Short_Integer; pragma Import (Ada, E063, "system__object_reader_E");
   E044 : Short_Integer; pragma Import (Ada, E044, "system__dwarf_lines_E");
   E190 : Short_Integer; pragma Import (Ada, E190, "system__pool_global_E");
   E217 : Short_Integer; pragma Import (Ada, E217, "gnat__sockets_E");
   E241 : Short_Integer; pragma Import (Ada, E241, "gnat__sockets__convenience_E");
   E238 : Short_Integer; pragma Import (Ada, E238, "system__pool_size_E");
   E015 : Short_Integer; pragma Import (Ada, E015, "system__secondary_stack_E");
   E131 : Short_Integer; pragma Import (Ada, E131, "ada__strings__unbounded_E");
   E234 : Short_Integer; pragma Import (Ada, E234, "gnat__sockets__thin_common_E");
   E220 : Short_Integer; pragma Import (Ada, E220, "gnat__sockets__thin_E");
   E034 : Short_Integer; pragma Import (Ada, E034, "system__traceback__symbolic_E");
   E155 : Short_Integer; pragma Import (Ada, E155, "ada__text_io_E");
   E093 : Short_Integer; pragma Import (Ada, E093, "black_E");
   E178 : Short_Integer; pragma Import (Ada, E178, "black__generic_optional_E");
   E183 : Short_Integer; pragma Import (Ada, E183, "black__parameter_E");
   E185 : Short_Integer; pragma Import (Ada, E185, "black__parameter__vectors_E");
   E194 : Short_Integer; pragma Import (Ada, E194, "black__parsing_E");
   E095 : Short_Integer; pragma Import (Ada, E095, "black__request_E");
   E205 : Short_Integer; pragma Import (Ada, E205, "black__response_E");
   E101 : Short_Integer; pragma Import (Ada, E101, "black__text_io_E");
   E151 : Short_Integer; pragma Import (Ada, E151, "hex_utilities_E");
   E149 : Short_Integer; pragma Import (Ada, E149, "url_utilities_E");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E095 := E095 - 1;
      E194 := E194 - 1;
      E205 := E205 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "black__response__finalize_spec");
      begin
         F1;
      end;
      declare
         procedure F2;
         pragma Import (Ada, F2, "black__request__finalize_spec");
      begin
         F2;
      end;
      declare
         procedure F3;
         pragma Import (Ada, F3, "black__parsing__finalize_spec");
      begin
         F3;
      end;
      E155 := E155 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "ada__text_io__finalize_spec");
      begin
         F4;
      end;
      declare
         procedure F5;
         pragma Import (Ada, F5, "gnat__sockets__finalize_body");
      begin
         E217 := E217 - 1;
         F5;
      end;
      E131 := E131 - 1;
      declare
         procedure F6;
         pragma Import (Ada, F6, "ada__strings__unbounded__finalize_spec");
      begin
         F6;
      end;
      declare
         procedure F7;
         pragma Import (Ada, F7, "system__file_io__finalize_body");
      begin
         E121 := E121 - 1;
         F7;
      end;
      E137 := E137 - 1;
      E135 := E135 - 1;
      E238 := E238 - 1;
      declare
         procedure F8;
         pragma Import (Ada, F8, "system__pool_size__finalize_spec");
      begin
         F8;
      end;
      declare
         procedure F9;
         pragma Import (Ada, F9, "gnat__sockets__finalize_spec");
      begin
         F9;
      end;
      E190 := E190 - 1;
      declare
         procedure F10;
         pragma Import (Ada, F10, "system__pool_global__finalize_spec");
      begin
         F10;
      end;
      declare
         procedure F11;
         pragma Import (Ada, F11, "system__storage_pools__subpools__finalize_spec");
      begin
         F11;
      end;
      declare
         procedure F12;
         pragma Import (Ada, F12, "system__finalization_masters__finalize_spec");
      begin
         F12;
      end;
      E117 := E117 - 1;
      declare
         procedure F13;
         pragma Import (Ada, F13, "ada__streams__stream_io__finalize_spec");
      begin
         F13;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E021 := E021 + 1;
      Ada.Containers'Elab_Spec;
      E186 := E186 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E084 := E084 + 1;
      Ada.Strings'Elab_Spec;
      E049 := E049 + 1;
      Ada.Strings.Maps'Elab_Spec;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E055 := E055 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Streams'Elab_Spec;
      E086 := E086 + 1;
      Interfaces.C'Elab_Spec;
      Interfaces.C.Strings'Elab_Spec;
      System.Exceptions'Elab_Spec;
      E023 := E023 + 1;
      System.File_Control_Block'Elab_Spec;
      E129 := E129 + 1;
      Ada.Streams.Stream_Io'Elab_Spec;
      E117 := E117 + 1;
      System.Finalization_Root'Elab_Spec;
      E124 := E124 + 1;
      Ada.Finalization'Elab_Spec;
      E122 := E122 + 1;
      System.Storage_Pools'Elab_Spec;
      E139 := E139 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Storage_Pools.Subpools'Elab_Spec;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E224 := E224 + 1;
      Ada.Calendar.Delays'Elab_Body;
      E222 := E222 + 1;
      E210 := E210 + 1;
      E212 := E212 + 1;
      Gnat.Sha1'Elab_Spec;
      E208 := E208 + 1;
      System.Assertions'Elab_Spec;
      E103 := E103 + 1;
      System.Object_Reader'Elab_Spec;
      System.Dwarf_Lines'Elab_Spec;
      System.Pool_Global'Elab_Spec;
      E190 := E190 + 1;
      Gnat.Sockets'Elab_Spec;
      System.Pool_Size'Elab_Spec;
      E238 := E238 + 1;
      E135 := E135 + 1;
      System.Finalization_Masters'Elab_Body;
      E137 := E137 + 1;
      System.File_Io'Elab_Body;
      E121 := E121 + 1;
      E236 := E236 + 1;
      E039 := E039 + 1;
      Ada.Tags'Elab_Body;
      E088 := E088 + 1;
      E051 := E051 + 1;
      System.Soft_Links'Elab_Body;
      E011 := E011 + 1;
      System.Os_Lib'Elab_Body;
      E126 := E126 + 1;
      System.Secondary_Stack'Elab_Body;
      E015 := E015 + 1;
      E241 := E241 + 1;
      E044 := E044 + 1;
      E063 := E063 + 1;
      Ada.Strings.Unbounded'Elab_Spec;
      E131 := E131 + 1;
      Gnat.Sockets.Thin_Common'Elab_Spec;
      E234 := E234 + 1;
      E220 := E220 + 1;
      Gnat.Sockets'Elab_Body;
      E217 := E217 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E034 := E034 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E155 := E155 + 1;
      Black'Elab_Spec;
      E093 := E093 + 1;
      E178 := E178 + 1;
      Black.Parameter'Elab_Spec;
      E183 := E183 + 1;
      Black.Parameter.Vectors'Elab_Spec;
      E185 := E185 + 1;
      Black.Parsing'Elab_Spec;
      Black.Request'Elab_Spec;
      Black.Response'Elab_Spec;
      E101 := E101 + 1;
      E205 := E205 + 1;
      E194 := E194 + 1;
      E151 := E151 + 1;
      Url_Utilities'Elab_Spec;
      Url_Utilities'Elab_Body;
      E149 := E149 + 1;
      E095 := E095 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_single_thread_server");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      gnat_argc := argc;
      gnat_argv := argv;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   /home/user/Projects/Black-examples/obj/gnat-sockets-convenience.o
   --   /home/user/Projects/Black-examples/obj/black.o
   --   /home/user/Projects/Black-examples/obj/black-http.o
   --   /home/user/Projects/Black-examples/obj/black-generic_optional.o
   --   /home/user/Projects/Black-examples/obj/black-mime_types.o
   --   /home/user/Projects/Black-examples/obj/black-optional_http_method.o
   --   /home/user/Projects/Black-examples/obj/black-optional_natural.o
   --   /home/user/Projects/Black-examples/obj/black-optional_string.o
   --   /home/user/Projects/Black-examples/obj/black-parameter.o
   --   /home/user/Projects/Black-examples/obj/black-parameter-vectors.o
   --   /home/user/Projects/Black-examples/obj/single_thread_server.o
   --   /home/user/Projects/Black-examples/obj/black-text_io.o
   --   /home/user/Projects/Black-examples/obj/black-response.o
   --   /home/user/Projects/Black-examples/obj/black-parsing.o
   --   /home/user/Projects/Black-examples/obj/hex_utilities.o
   --   /home/user/Projects/Black-examples/obj/url_utilities.o
   --   /home/user/Projects/Black-examples/obj/black-request.o
   --   -L/home/user/Projects/Black-examples/obj/
   --   -L/home/user/Projects/Black-examples/obj/
   --   -L/opt/gnat/lib/aws/
   --   -L/opt/gnat/lib/aunit/
   --   -L/usr/local/lib/matreshka/league/
   --   -L/opt/gnat/lib/gcc/x86_64-pc-linux-gnu/4.9.4/adalib/
   --   -static
   --   -lgnat
   --   -ldl
--  END Object file/option list   

end ada_main;
