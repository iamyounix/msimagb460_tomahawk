# Graphics

## OpenCL

```zsh
Number of platforms                               2
  Platform Name                                   Clover
  Platform Vendor                                 Mesa
  Platform Version                                OpenCL 1.1 Mesa 23.1.3
  Platform Profile                                FULL_PROFILE
  Platform Extensions                             cl_khr_icd
  Platform Extensions function suffix             MESA

  Platform Name                                   rusticl
  Platform Vendor                                 Mesa/X.org
  Platform Version                                OpenCL 3.0 
  Platform Profile                                FULL_PROFILE
  Platform Extensions                             cl_khr_icd cl_khr_il_program
  Platform Extensions with Version                cl_khr_icd                                                       0x400000 (1.0.0)
                                                  cl_khr_il_program                                                0x400000 (1.0.0)
  Platform Numeric Version                        0xc00000 (3.0.0)
  Platform Extensions function suffix             MESA
  Platform Host timer resolution                  0ns

  Platform Name                                   Clover
Number of devices                                 1
  Device Name                                     AMD Radeon RX 5500 XT (navi14, LLVM 15.0.7, DRM 3.52, 6.3.9-arch1-1)
  Device Vendor                                   AMD
  Device Vendor ID                                0x1002
  Device Version                                  OpenCL 1.1 Mesa 23.1.3
  Device Numeric Version                          0x401000 (1.1.0)
  Driver Version                                  23.1.3
  Device OpenCL C Version                         OpenCL C 1.1 
  Device Type                                     GPU
  Device Profile                                  FULL_PROFILE
  Device Available                                Yes
  Compiler Available                              Yes
  Max compute units                               22
  Max clock frequency                             1900MHz
  Max work item dimensions                        3
  Max work item sizes                             256x256x256
  Max work group size                             256
=== CL_PROGRAM_BUILD_LOG ===
fatal error: cannot open file '/usr/share/clc/gfx1012-amdgcn-mesa-mesa3d.bc': No such file or directory
  Preferred work group size multiple (kernel)     <getWGsizes:1504: create kernel : error -46>
  Preferred / native vector sizes                 
    char                                                16 / 16      
    short                                                8 / 8       
    int                                                  4 / 4       
    long                                                 2 / 2       
    half                                                 0 / 0        (n/a)
    float                                                4 / 4       
    double                                               2 / 2        (cl_khr_fp64)
  Half-precision Floating-point support           (n/a)
  Single-precision Floating-point support         (core)
    Denormals                                     No
    Infinity and NANs                             Yes
    Round to nearest                              Yes
    Round to zero                                 No
    Round to infinity                             No
    IEEE754-2008 fused multiply-add               No
    Support is emulated in software               No
    Correctly-rounded divide and sqrt operations  No
  Double-precision Floating-point support         (cl_khr_fp64)
    Denormals                                     Yes
    Infinity and NANs                             Yes
    Round to nearest                              Yes
    Round to zero                                 Yes
    Round to infinity                             Yes
    IEEE754-2008 fused multiply-add               Yes
    Support is emulated in software               No
  Address bits                                    64, Little-Endian
  Global memory size                              4294967296 (4GiB)
  Error Correction support                        No
  Max memory allocation                           1073741824 (1024MiB)
  Unified memory for Host and Device              No
  Minimum alignment for any data type             128 bytes
  Alignment of base address                       32768 bits (4096 bytes)
  Global Memory cache type                        None
  Image support                                   No
  Local memory type                               Local
  Local memory size                               65536 (64KiB)
  Max number of constant args                     16
  Max constant buffer size                        67108864 (64MiB)
  Max size of kernel argument                     1024
  Queue properties                                
    Out-of-order execution                        No
    Profiling                                     Yes
  Profiling timer resolution                      0ns
  Execution capabilities                          
    Run OpenCL kernels                            Yes
    Run native kernels                            No
    ILs with version                              SPIR-V                                                           0x400000 (1.0.0)
  Built-in kernels with version                   (n/a)
  Device Extensions                               cl_khr_byte_addressable_store cl_khr_global_int32_base_atomics cl_khr_global_int32_extended_atomics cl_khr_local_int32_base_atomics cl_khr_local_int32_extended_atomics cl_khr_int64_base_atomics cl_khr_int64_extended_atomics cl_khr_fp64 cl_khr_extended_versioning
  Device Extensions with Version                  cl_khr_byte_addressable_store                                    0x400000 (1.0.0)
                                                  cl_khr_global_int32_base_atomics                                 0x400000 (1.0.0)
                                                  cl_khr_global_int32_extended_atomics                             0x400000 (1.0.0)
                                                  cl_khr_local_int32_base_atomics                                  0x400000 (1.0.0)
                                                  cl_khr_local_int32_extended_atomics                              0x400000 (1.0.0)
                                                  cl_khr_int64_base_atomics                                        0x400000 (1.0.0)
                                                  cl_khr_int64_extended_atomics                                    0x400000 (1.0.0)
                                                  cl_khr_fp64                                                      0x400000 (1.0.0)
                                                  cl_khr_extended_versioning                                       0x400000 (1.0.0)

  Platform Name                                   rusticl
Number of devices                                 0

NULL platform behavior
  clGetPlatformInfo(NULL, CL_PLATFORM_NAME, ...)  Clover
  clGetDeviceIDs(NULL, CL_DEVICE_TYPE_ALL, ...)   Success [MESA]
  clCreateContext(NULL, ...) [default]            Success [MESA]
  clCreateContext(NULL, ...) [other]              
  clCreateContextFromType(NULL, CL_DEVICE_TYPE_DEFAULT)  Success (1)
    Platform Name                                 Clover
    Device Name                                   AMD Radeon RX 5500 XT (navi14, LLVM 15.0.7, DRM 3.52, 6.3.9-arch1-1)
  clCreateContextFromType(NULL, CL_DEVICE_TYPE_CPU)  No devices found in platform
  clCreateContextFromType(NULL, CL_DEVICE_TYPE_GPU)  Success (1)
    Platform Name                                 Clover
    Device Name                                   AMD Radeon RX 5500 XT (navi14, LLVM 15.0.7, DRM 3.52, 6.3.9-arch1-1)
  clCreateContextFromType(NULL, CL_DEVICE_TYPE_ACCELERATOR)  No devices found in platform
  clCreateContextFromType(NULL, CL_DEVICE_TYPE_CUSTOM)  No devices found in platform
  clCreateContextFromType(NULL, CL_DEVICE_TYPE_ALL)  Success (1)
    Platform Name                                 Clover
    Device Name                                   AMD Radeon RX 5500 XT (navi14, LLVM 15.0.7, DRM 3.52, 6.3.9-arch1-1)

ICD loader properties
  ICD loader Name                                 OpenCL ICD Loader
  ICD loader Vendor                               OCL Icd free software
  ICD loader Version                              2.3.2
  ICD loader Profile                              OpenCL 3.0
```

## OpenGL (EGL)

```zsh
EGL client extensions string:
    EGL_EXT_client_extensions, EGL_EXT_device_base, 
    EGL_EXT_device_enumeration, EGL_EXT_device_query, EGL_EXT_platform_base, 
    EGL_EXT_platform_device, EGL_EXT_platform_wayland, EGL_EXT_platform_x11, 
    EGL_EXT_platform_xcb, EGL_KHR_client_get_all_proc_addresses, 
    EGL_KHR_debug, EGL_KHR_platform_gbm, EGL_KHR_platform_wayland, 
    EGL_KHR_platform_x11, EGL_MESA_platform_gbm, 
    EGL_MESA_platform_surfaceless

GBM platform:
EGL API version: 1.5
EGL vendor string: Mesa Project
EGL version string: 1.5
EGL client APIs: OpenGL OpenGL_ES 
EGL driver name: iris
EGL extensions string:
    EGL_ANDROID_blob_cache, EGL_ANDROID_native_fence_sync, EGL_EXT_buffer_age, 
    EGL_EXT_create_context_robustness, EGL_EXT_image_dma_buf_import, 
    EGL_EXT_image_dma_buf_import_modifiers, EGL_EXT_pixel_format_float, 
    EGL_IMG_context_priority, EGL_KHR_cl_event2, EGL_KHR_config_attribs, 
    EGL_KHR_context_flush_control, EGL_KHR_create_context, 
    EGL_KHR_create_context_no_error, EGL_KHR_fence_sync, 
    EGL_KHR_get_all_proc_addresses, EGL_KHR_gl_colorspace, 
    EGL_KHR_gl_renderbuffer_image, EGL_KHR_gl_texture_2D_image, 
    EGL_KHR_gl_texture_3D_image, EGL_KHR_gl_texture_cubemap_image, 
    EGL_KHR_image, EGL_KHR_image_base, EGL_KHR_image_pixmap, 
    EGL_KHR_no_config_context, EGL_KHR_reusable_sync, 
    EGL_KHR_surfaceless_context, EGL_KHR_wait_sync, 
    EGL_MESA_configless_context, EGL_MESA_drm_image, 
    EGL_MESA_image_dma_buf_export, EGL_MESA_query_driver, 
    EGL_WL_bind_wayland_display
OpenGL core profile vendor: Intel
OpenGL core profile renderer: Mesa Intel(R) UHD Graphics 630 (CML GT2)
OpenGL core profile version: 4.6 (Core Profile) Mesa 23.1.3
OpenGL core profile shading language version: 4.60
OpenGL core profile extensions:
    GL_3DFX_texture_compression_FXT1, GL_AMD_conservative_depth, 
    GL_AMD_depth_clamp_separate, GL_AMD_draw_buffers_blend, 
    GL_AMD_gpu_shader_int64, GL_AMD_multi_draw_indirect, 
    GL_AMD_performance_monitor, GL_AMD_pinned_memory, 
    GL_AMD_query_buffer_object, GL_AMD_seamless_cubemap_per_texture, 
    GL_AMD_shader_stencil_export, GL_AMD_shader_trinary_minmax, 
    GL_AMD_texture_texture4, GL_AMD_vertex_shader_layer, 
    GL_AMD_vertex_shader_viewport_index, GL_ANGLE_texture_compression_dxt3, 
    GL_ANGLE_texture_compression_dxt5, GL_ARB_ES2_compatibility, 
    GL_ARB_ES3_1_compatibility, GL_ARB_ES3_2_compatibility, 
    GL_ARB_ES3_compatibility, GL_ARB_arrays_of_arrays, GL_ARB_base_instance, 
    GL_ARB_blend_func_extended, GL_ARB_buffer_storage, 
    GL_ARB_clear_buffer_object, GL_ARB_clear_texture, GL_ARB_clip_control, 
    GL_ARB_compressed_texture_pixel_storage, GL_ARB_compute_shader, 
    GL_ARB_compute_variable_group_size, GL_ARB_conditional_render_inverted, 
    GL_ARB_conservative_depth, GL_ARB_copy_buffer, GL_ARB_copy_image, 
    GL_ARB_cull_distance, GL_ARB_debug_output, GL_ARB_depth_buffer_float, 
    GL_ARB_depth_clamp, GL_ARB_derivative_control, GL_ARB_direct_state_access, 
    GL_ARB_draw_buffers, GL_ARB_draw_buffers_blend, 
    GL_ARB_draw_elements_base_vertex, GL_ARB_draw_indirect, 
    GL_ARB_draw_instanced, GL_ARB_enhanced_layouts, 
    GL_ARB_explicit_attrib_location, GL_ARB_explicit_uniform_location, 
    GL_ARB_fragment_coord_conventions, GL_ARB_fragment_layer_viewport, 
    GL_ARB_fragment_shader, GL_ARB_fragment_shader_interlock, 
    GL_ARB_framebuffer_no_attachments, GL_ARB_framebuffer_object, 
    GL_ARB_framebuffer_sRGB, GL_ARB_get_program_binary, 
    GL_ARB_get_texture_sub_image, GL_ARB_gl_spirv, GL_ARB_gpu_shader5, 
    GL_ARB_gpu_shader_fp64, GL_ARB_gpu_shader_int64, GL_ARB_half_float_pixel, 
    GL_ARB_half_float_vertex, GL_ARB_indirect_parameters, 
    GL_ARB_instanced_arrays, GL_ARB_internalformat_query, 
    GL_ARB_internalformat_query2, GL_ARB_invalidate_subdata, 
    GL_ARB_map_buffer_alignment, GL_ARB_map_buffer_range, GL_ARB_multi_bind, 
    GL_ARB_multi_draw_indirect, GL_ARB_occlusion_query2, 
    GL_ARB_parallel_shader_compile, GL_ARB_pipeline_statistics_query, 
    GL_ARB_pixel_buffer_object, GL_ARB_point_sprite, 
    GL_ARB_polygon_offset_clamp, GL_ARB_post_depth_coverage, 
    GL_ARB_program_interface_query, GL_ARB_provoking_vertex, 
    GL_ARB_query_buffer_object, GL_ARB_robust_buffer_access_behavior, 
    GL_ARB_robustness, GL_ARB_sample_shading, GL_ARB_sampler_objects, 
    GL_ARB_seamless_cube_map, GL_ARB_seamless_cubemap_per_texture, 
    GL_ARB_separate_shader_objects, GL_ARB_shader_atomic_counter_ops, 
    GL_ARB_shader_atomic_counters, GL_ARB_shader_ballot, 
    GL_ARB_shader_bit_encoding, GL_ARB_shader_clock, 
    GL_ARB_shader_draw_parameters, GL_ARB_shader_group_vote, 
    GL_ARB_shader_image_load_store, GL_ARB_shader_image_size, 
    GL_ARB_shader_objects, GL_ARB_shader_precision, 
    GL_ARB_shader_stencil_export, GL_ARB_shader_storage_buffer_object, 
    GL_ARB_shader_subroutine, GL_ARB_shader_texture_image_samples, 
    GL_ARB_shader_texture_lod, GL_ARB_shader_viewport_layer_array, 
    GL_ARB_shading_language_420pack, GL_ARB_shading_language_include, 
    GL_ARB_shading_language_packing, GL_ARB_spirv_extensions, 
    GL_ARB_stencil_texturing, GL_ARB_sync, GL_ARB_tessellation_shader, 
    GL_ARB_texture_barrier, GL_ARB_texture_buffer_object, 
    GL_ARB_texture_buffer_object_rgb32, GL_ARB_texture_buffer_range, 
    GL_ARB_texture_compression_bptc, GL_ARB_texture_compression_rgtc, 
    GL_ARB_texture_cube_map_array, GL_ARB_texture_filter_anisotropic, 
    GL_ARB_texture_float, GL_ARB_texture_gather, 
    GL_ARB_texture_mirror_clamp_to_edge, GL_ARB_texture_multisample, 
    GL_ARB_texture_non_power_of_two, GL_ARB_texture_query_levels, 
    GL_ARB_texture_query_lod, GL_ARB_texture_rectangle, GL_ARB_texture_rg, 
    GL_ARB_texture_rgb10_a2ui, GL_ARB_texture_stencil8, 
    GL_ARB_texture_storage, GL_ARB_texture_storage_multisample, 
    GL_ARB_texture_swizzle, GL_ARB_texture_view, GL_ARB_timer_query, 
    GL_ARB_transform_feedback2, GL_ARB_transform_feedback3, 
    GL_ARB_transform_feedback_instanced, 
    GL_ARB_transform_feedback_overflow_query, GL_ARB_uniform_buffer_object, 
    GL_ARB_vertex_array_bgra, GL_ARB_vertex_array_object, 
    GL_ARB_vertex_attrib_64bit, GL_ARB_vertex_attrib_binding, 
    GL_ARB_vertex_buffer_object, GL_ARB_vertex_shader, 
    GL_ARB_vertex_type_10f_11f_11f_rev, GL_ARB_vertex_type_2_10_10_10_rev, 
    GL_ARB_viewport_array, GL_ATI_blend_equation_separate, 
    GL_ATI_texture_float, GL_EXT_EGL_image_storage, GL_EXT_EGL_sync, 
    GL_EXT_abgr, GL_EXT_blend_equation_separate, GL_EXT_debug_label, 
    GL_EXT_demote_to_helper_invocation, GL_EXT_draw_buffers2, 
    GL_EXT_draw_instanced, GL_EXT_framebuffer_blit, 
    GL_EXT_framebuffer_multisample, GL_EXT_framebuffer_multisample_blit_scaled, 
    GL_EXT_framebuffer_object, GL_EXT_framebuffer_sRGB, GL_EXT_memory_object, 
    GL_EXT_memory_object_fd, GL_EXT_packed_depth_stencil, GL_EXT_packed_float, 
    GL_EXT_pixel_buffer_object, GL_EXT_polygon_offset_clamp, 
    GL_EXT_provoking_vertex, GL_EXT_semaphore, GL_EXT_semaphore_fd, 
    GL_EXT_shader_framebuffer_fetch, 
    GL_EXT_shader_framebuffer_fetch_non_coherent, GL_EXT_shader_integer_mix, 
    GL_EXT_shader_samples_identical, GL_EXT_texture_array, 
    GL_EXT_texture_compression_dxt1, GL_EXT_texture_compression_rgtc, 
    GL_EXT_texture_compression_s3tc, GL_EXT_texture_filter_anisotropic, 
    GL_EXT_texture_integer, GL_EXT_texture_sRGB, GL_EXT_texture_sRGB_R8, 
    GL_EXT_texture_sRGB_decode, GL_EXT_texture_shadow_lod, 
    GL_EXT_texture_shared_exponent, GL_EXT_texture_snorm, 
    GL_EXT_texture_swizzle, GL_EXT_timer_query, GL_EXT_transform_feedback, 
    GL_EXT_vertex_array_bgra, GL_EXT_vertex_attrib_64bit, 
    GL_IBM_multimode_draw_arrays, GL_INTEL_blackhole_render, 
    GL_INTEL_conservative_rasterization, GL_INTEL_performance_query, 
    GL_INTEL_shader_atomic_float_minmax, GL_INTEL_shader_integer_functions2, 
    GL_KHR_blend_equation_advanced, GL_KHR_blend_equation_advanced_coherent, 
    GL_KHR_context_flush_control, GL_KHR_debug, GL_KHR_no_error, 
    GL_KHR_parallel_shader_compile, GL_KHR_robust_buffer_access_behavior, 
    GL_KHR_robustness, GL_KHR_texture_compression_astc_ldr, 
    GL_KHR_texture_compression_astc_sliced_3d, GL_MESA_framebuffer_flip_y, 
    GL_MESA_pack_invert, GL_MESA_shader_integer_functions, 
    GL_MESA_texture_signed_rgba, GL_NV_alpha_to_coverage_dither_control, 
    GL_NV_compute_shader_derivatives, GL_NV_conditional_render, 
    GL_NV_copy_image, GL_NV_depth_clamp, GL_NV_fragment_shader_interlock, 
    GL_NV_packed_depth_stencil, GL_NV_texture_barrier, GL_OES_EGL_image, 
    GL_S3_s3tc
OpenGL compatibility profile vendor: Intel
OpenGL compatibility profile renderer: Mesa Intel(R) UHD Graphics 630 (CML GT2)
OpenGL compatibility profile version: 4.6 (Compatibility Profile) Mesa 23.1.3
OpenGL compatibility profile shading language version: 4.60
OpenGL compatibility profile extensions:
    GL_3DFX_texture_compression_FXT1, GL_AMD_conservative_depth, 
    GL_AMD_depth_clamp_separate, GL_AMD_draw_buffers_blend, 
    GL_AMD_multi_draw_indirect, GL_AMD_performance_monitor, 
    GL_AMD_pinned_memory, GL_AMD_query_buffer_object, 
    GL_AMD_seamless_cubemap_per_texture, GL_AMD_shader_stencil_export, 
    GL_AMD_shader_trinary_minmax, GL_AMD_texture_texture4, 
    GL_AMD_vertex_shader_layer, GL_AMD_vertex_shader_viewport_index, 
    GL_ANGLE_texture_compression_dxt3, GL_ANGLE_texture_compression_dxt5, 
    GL_APPLE_packed_pixels, GL_ARB_ES2_compatibility, 
    GL_ARB_ES3_1_compatibility, GL_ARB_ES3_2_compatibility, 
    GL_ARB_ES3_compatibility, GL_ARB_arrays_of_arrays, GL_ARB_base_instance, 
    GL_ARB_blend_func_extended, GL_ARB_buffer_storage, 
    GL_ARB_clear_buffer_object, GL_ARB_clear_texture, GL_ARB_clip_control, 
    GL_ARB_color_buffer_float, GL_ARB_compatibility, 
    GL_ARB_compressed_texture_pixel_storage, GL_ARB_compute_shader, 
    GL_ARB_compute_variable_group_size, GL_ARB_conditional_render_inverted, 
    GL_ARB_conservative_depth, GL_ARB_copy_buffer, GL_ARB_copy_image, 
    GL_ARB_cull_distance, GL_ARB_debug_output, GL_ARB_depth_buffer_float, 
    GL_ARB_depth_clamp, GL_ARB_depth_texture, GL_ARB_derivative_control, 
    GL_ARB_direct_state_access, GL_ARB_draw_buffers, 
    GL_ARB_draw_buffers_blend, GL_ARB_draw_elements_base_vertex, 
    GL_ARB_draw_indirect, GL_ARB_draw_instanced, GL_ARB_enhanced_layouts, 
    GL_ARB_explicit_attrib_location, GL_ARB_explicit_uniform_location, 
    GL_ARB_fragment_coord_conventions, GL_ARB_fragment_layer_viewport, 
    GL_ARB_fragment_program, GL_ARB_fragment_program_shadow, 
    GL_ARB_fragment_shader, GL_ARB_fragment_shader_interlock, 
    GL_ARB_framebuffer_no_attachments, GL_ARB_framebuffer_object, 
    GL_ARB_framebuffer_sRGB, GL_ARB_get_program_binary, 
    GL_ARB_get_texture_sub_image, GL_ARB_gl_spirv, GL_ARB_gpu_shader5, 
    GL_ARB_gpu_shader_fp64, GL_ARB_gpu_shader_int64, GL_ARB_half_float_pixel, 
    GL_ARB_half_float_vertex, GL_ARB_indirect_parameters, 
    GL_ARB_instanced_arrays, GL_ARB_internalformat_query, 
    GL_ARB_internalformat_query2, GL_ARB_invalidate_subdata, 
    GL_ARB_map_buffer_alignment, GL_ARB_map_buffer_range, GL_ARB_multi_bind, 
    GL_ARB_multi_draw_indirect, GL_ARB_multisample, GL_ARB_multitexture, 
    GL_ARB_occlusion_query, GL_ARB_occlusion_query2, 
    GL_ARB_parallel_shader_compile, GL_ARB_pipeline_statistics_query, 
    GL_ARB_pixel_buffer_object, GL_ARB_point_parameters, GL_ARB_point_sprite, 
    GL_ARB_polygon_offset_clamp, GL_ARB_post_depth_coverage, 
    GL_ARB_program_interface_query, GL_ARB_provoking_vertex, 
    GL_ARB_query_buffer_object, GL_ARB_robust_buffer_access_behavior, 
    GL_ARB_robustness, GL_ARB_sample_shading, GL_ARB_sampler_objects, 
    GL_ARB_seamless_cube_map, GL_ARB_seamless_cubemap_per_texture, 
    GL_ARB_separate_shader_objects, GL_ARB_shader_atomic_counter_ops, 
    GL_ARB_shader_atomic_counters, GL_ARB_shader_ballot, 
    GL_ARB_shader_bit_encoding, GL_ARB_shader_clock, 
    GL_ARB_shader_draw_parameters, GL_ARB_shader_group_vote, 
    GL_ARB_shader_image_load_store, GL_ARB_shader_image_size, 
    GL_ARB_shader_objects, GL_ARB_shader_precision, 
    GL_ARB_shader_stencil_export, GL_ARB_shader_storage_buffer_object, 
    GL_ARB_shader_subroutine, GL_ARB_shader_texture_image_samples, 
    GL_ARB_shader_texture_lod, GL_ARB_shader_viewport_layer_array, 
    GL_ARB_shading_language_100, GL_ARB_shading_language_420pack, 
    GL_ARB_shading_language_include, GL_ARB_shading_language_packing, 
    GL_ARB_shadow, GL_ARB_spirv_extensions, GL_ARB_stencil_texturing, 
    GL_ARB_sync, GL_ARB_tessellation_shader, GL_ARB_texture_barrier, 
    GL_ARB_texture_border_clamp, GL_ARB_texture_buffer_object, 
    GL_ARB_texture_buffer_object_rgb32, GL_ARB_texture_buffer_range, 
    GL_ARB_texture_compression, GL_ARB_texture_compression_bptc, 
    GL_ARB_texture_compression_rgtc, GL_ARB_texture_cube_map, 
    GL_ARB_texture_cube_map_array, GL_ARB_texture_env_add, 
    GL_ARB_texture_env_combine, GL_ARB_texture_env_crossbar, 
    GL_ARB_texture_env_dot3, GL_ARB_texture_filter_anisotropic, 
    GL_ARB_texture_float, GL_ARB_texture_gather, 
    GL_ARB_texture_mirror_clamp_to_edge, GL_ARB_texture_mirrored_repeat, 
    GL_ARB_texture_multisample, GL_ARB_texture_non_power_of_two, 
    GL_ARB_texture_query_levels, GL_ARB_texture_query_lod, 
    GL_ARB_texture_rectangle, GL_ARB_texture_rg, GL_ARB_texture_rgb10_a2ui, 
    GL_ARB_texture_stencil8, GL_ARB_texture_storage, 
    GL_ARB_texture_storage_multisample, GL_ARB_texture_swizzle, 
    GL_ARB_texture_view, GL_ARB_timer_query, GL_ARB_transform_feedback2, 
    GL_ARB_transform_feedback3, GL_ARB_transform_feedback_instanced, 
    GL_ARB_transform_feedback_overflow_query, GL_ARB_transpose_matrix, 
    GL_ARB_uniform_buffer_object, GL_ARB_vertex_array_bgra, 
    GL_ARB_vertex_array_object, GL_ARB_vertex_attrib_64bit, 
    GL_ARB_vertex_attrib_binding, GL_ARB_vertex_buffer_object, 
    GL_ARB_vertex_program, GL_ARB_vertex_shader, 
    GL_ARB_vertex_type_10f_11f_11f_rev, GL_ARB_vertex_type_2_10_10_10_rev, 
    GL_ARB_viewport_array, GL_ARB_window_pos, GL_ATI_blend_equation_separate, 
    GL_ATI_draw_buffers, GL_ATI_fragment_shader, GL_ATI_separate_stencil, 
    GL_ATI_texture_compression_3dc, GL_ATI_texture_env_combine3, 
    GL_ATI_texture_float, GL_EXT_EGL_image_storage, GL_EXT_EGL_sync, 
    GL_EXT_abgr, GL_EXT_bgra, GL_EXT_blend_color, 
    GL_EXT_blend_equation_separate, GL_EXT_blend_func_separate, 
    GL_EXT_blend_minmax, GL_EXT_blend_subtract, GL_EXT_compiled_vertex_array, 
    GL_EXT_copy_texture, GL_EXT_debug_label, 
    GL_EXT_demote_to_helper_invocation, GL_EXT_direct_state_access, 
    GL_EXT_draw_buffers2, GL_EXT_draw_instanced, GL_EXT_draw_range_elements, 
    GL_EXT_fog_coord, GL_EXT_framebuffer_blit, GL_EXT_framebuffer_multisample, 
    GL_EXT_framebuffer_multisample_blit_scaled, GL_EXT_framebuffer_object, 
    GL_EXT_framebuffer_sRGB, GL_EXT_gpu_program_parameters, 
    GL_EXT_gpu_shader4, GL_EXT_memory_object, GL_EXT_memory_object_fd, 
    GL_EXT_multi_draw_arrays, GL_EXT_packed_depth_stencil, 
    GL_EXT_packed_float, GL_EXT_packed_pixels, GL_EXT_pixel_buffer_object, 
    GL_EXT_point_parameters, GL_EXT_polygon_offset_clamp, 
    GL_EXT_provoking_vertex, GL_EXT_rescale_normal, GL_EXT_secondary_color, 
    GL_EXT_semaphore, GL_EXT_semaphore_fd, GL_EXT_separate_specular_color, 
    GL_EXT_shader_framebuffer_fetch, 
    GL_EXT_shader_framebuffer_fetch_non_coherent, GL_EXT_shader_integer_mix, 
    GL_EXT_shader_samples_identical, GL_EXT_shadow_funcs, 
    GL_EXT_stencil_two_side, GL_EXT_stencil_wrap, GL_EXT_subtexture, 
    GL_EXT_texture, GL_EXT_texture3D, GL_EXT_texture_array, 
    GL_EXT_texture_buffer_object, GL_EXT_texture_compression_dxt1, 
    GL_EXT_texture_compression_latc, GL_EXT_texture_compression_rgtc, 
    GL_EXT_texture_compression_s3tc, GL_EXT_texture_cube_map, 
    GL_EXT_texture_edge_clamp, GL_EXT_texture_env_add, 
    GL_EXT_texture_env_combine, GL_EXT_texture_env_dot3, 
    GL_EXT_texture_filter_anisotropic, GL_EXT_texture_integer, 
    GL_EXT_texture_lod_bias, GL_EXT_texture_object, GL_EXT_texture_rectangle, 
    GL_EXT_texture_sRGB, GL_EXT_texture_sRGB_R8, GL_EXT_texture_sRGB_decode, 
    GL_EXT_texture_shadow_lod, GL_EXT_texture_shared_exponent, 
    GL_EXT_texture_snorm, GL_EXT_texture_swizzle, GL_EXT_timer_query, 
    GL_EXT_transform_feedback, GL_EXT_vertex_array, GL_EXT_vertex_array_bgra, 
    GL_EXT_vertex_attrib_64bit, GL_IBM_multimode_draw_arrays, 
    GL_IBM_rasterpos_clip, GL_IBM_texture_mirrored_repeat, 
    GL_INGR_blend_func_separate, GL_INTEL_blackhole_render, 
    GL_INTEL_performance_query, GL_INTEL_shader_atomic_float_minmax, 
    GL_INTEL_shader_integer_functions2, GL_KHR_blend_equation_advanced, 
    GL_KHR_blend_equation_advanced_coherent, GL_KHR_context_flush_control, 
    GL_KHR_debug, GL_KHR_no_error, GL_KHR_parallel_shader_compile, 
    GL_KHR_robust_buffer_access_behavior, GL_KHR_robustness, 
    GL_KHR_texture_compression_astc_ldr, 
    GL_KHR_texture_compression_astc_sliced_3d, GL_MESA_framebuffer_flip_y, 
    GL_MESA_pack_invert, GL_MESA_shader_integer_functions, 
    GL_MESA_texture_signed_rgba, GL_MESA_window_pos, 
    GL_NV_ES1_1_compatibility, GL_NV_alpha_to_coverage_dither_control, 
    GL_NV_blend_square, GL_NV_compute_shader_derivatives, 
    GL_NV_conditional_render, GL_NV_copy_depth_to_color, GL_NV_copy_image, 
    GL_NV_depth_clamp, GL_NV_fog_distance, GL_NV_fragment_shader_interlock, 
    GL_NV_half_float, GL_NV_light_max_exponent, GL_NV_packed_depth_stencil, 
    GL_NV_primitive_restart, GL_NV_texgen_reflection, GL_NV_texture_barrier, 
    GL_NV_texture_env_combine4, GL_NV_texture_rectangle, GL_OES_EGL_image, 
    GL_OES_read_format, GL_S3_s3tc, GL_SGIS_generate_mipmap, 
    GL_SGIS_texture_border_clamp, GL_SGIS_texture_edge_clamp, 
    GL_SGIS_texture_lod, GL_SUN_multi_draw_arrays
OpenGL ES profile vendor: Intel
OpenGL ES profile renderer: Mesa Intel(R) UHD Graphics 630 (CML GT2)
OpenGL ES profile version: OpenGL ES 3.2 Mesa 23.1.3
OpenGL ES profile shading language version: OpenGL ES GLSL ES 3.20
OpenGL ES profile extensions:
    GL_AMD_performance_monitor, GL_ANDROID_extension_pack_es31a, 
    GL_ANGLE_pack_reverse_row_order, GL_ANGLE_texture_compression_dxt3, 
    GL_ANGLE_texture_compression_dxt5, GL_APPLE_texture_max_level, 
    GL_EXT_EGL_image_storage, GL_EXT_base_instance, 
    GL_EXT_blend_func_extended, GL_EXT_blend_minmax, GL_EXT_buffer_storage, 
    GL_EXT_clear_texture, GL_EXT_clip_control, GL_EXT_clip_cull_distance, 
    GL_EXT_color_buffer_float, GL_EXT_color_buffer_half_float, 
    GL_EXT_compressed_ETC1_RGB8_sub_texture, GL_EXT_copy_image, 
    GL_EXT_debug_label, GL_EXT_demote_to_helper_invocation, 
    GL_EXT_depth_clamp, GL_EXT_discard_framebuffer, 
    GL_EXT_disjoint_timer_query, GL_EXT_draw_buffers, 
    GL_EXT_draw_buffers_indexed, GL_EXT_draw_elements_base_vertex, 
    GL_EXT_draw_instanced, GL_EXT_float_blend, GL_EXT_frag_depth, 
    GL_EXT_geometry_point_size, GL_EXT_geometry_shader, GL_EXT_gpu_shader5, 
    GL_EXT_instanced_arrays, GL_EXT_map_buffer_range, GL_EXT_memory_object, 
    GL_EXT_memory_object_fd, GL_EXT_multi_draw_arrays, 
    GL_EXT_occlusion_query_boolean, GL_EXT_polygon_offset_clamp, 
    GL_EXT_primitive_bounding_box, GL_EXT_read_format_bgra, 
    GL_EXT_render_snorm, GL_EXT_robustness, GL_EXT_sRGB_write_control, 
    GL_EXT_semaphore, GL_EXT_semaphore_fd, GL_EXT_separate_shader_objects, 
    GL_EXT_shader_framebuffer_fetch, 
    GL_EXT_shader_framebuffer_fetch_non_coherent, GL_EXT_shader_group_vote, 
    GL_EXT_shader_implicit_conversions, GL_EXT_shader_integer_mix, 
    GL_EXT_shader_io_blocks, GL_EXT_shader_samples_identical, 
    GL_EXT_tessellation_point_size, GL_EXT_tessellation_shader, 
    GL_EXT_texture_border_clamp, GL_EXT_texture_buffer, 
    GL_EXT_texture_compression_bptc, GL_EXT_texture_compression_dxt1, 
    GL_EXT_texture_compression_rgtc, GL_EXT_texture_compression_s3tc, 
    GL_EXT_texture_compression_s3tc_srgb, GL_EXT_texture_cube_map_array, 
    GL_EXT_texture_filter_anisotropic, GL_EXT_texture_format_BGRA8888, 
    GL_EXT_texture_mirror_clamp_to_edge, GL_EXT_texture_norm16, 
    GL_EXT_texture_query_lod, GL_EXT_texture_rg, GL_EXT_texture_sRGB_R8, 
    GL_EXT_texture_sRGB_decode, GL_EXT_texture_shadow_lod, 
    GL_EXT_texture_type_2_10_10_10_REV, GL_EXT_texture_view, 
    GL_EXT_unpack_subimage, GL_INTEL_blackhole_render, 
    GL_INTEL_conservative_rasterization, GL_INTEL_performance_query, 
    GL_KHR_blend_equation_advanced, GL_KHR_blend_equation_advanced_coherent, 
    GL_KHR_context_flush_control, GL_KHR_debug, GL_KHR_no_error, 
    GL_KHR_parallel_shader_compile, GL_KHR_robust_buffer_access_behavior, 
    GL_KHR_robustness, GL_KHR_texture_compression_astc_ldr, 
    GL_KHR_texture_compression_astc_sliced_3d, GL_MESA_bgra, 
    GL_MESA_framebuffer_flip_y, GL_MESA_shader_integer_functions, 
    GL_NV_alpha_to_coverage_dither_control, GL_NV_compute_shader_derivatives, 
    GL_NV_conditional_render, GL_NV_draw_buffers, GL_NV_fbo_color_attachments, 
    GL_NV_fragment_shader_interlock, GL_NV_generate_mipmap_sRGB, 
    GL_NV_image_formats, GL_NV_pack_subimage, GL_NV_pixel_buffer_object, 
    GL_NV_read_buffer, GL_NV_read_depth, GL_NV_read_depth_stencil, 
    GL_NV_read_stencil, GL_NV_shader_noperspective_interpolation, 
    GL_OES_EGL_image, GL_OES_EGL_image_external, 
    GL_OES_EGL_image_external_essl3, GL_OES_EGL_sync, 
    GL_OES_compressed_ETC1_RGB8_texture, GL_OES_copy_image, GL_OES_depth24, 
    GL_OES_depth_texture, GL_OES_depth_texture_cube_map, 
    GL_OES_draw_buffers_indexed, GL_OES_draw_elements_base_vertex, 
    GL_OES_element_index_uint, GL_OES_fbo_render_mipmap, 
    GL_OES_geometry_point_size, GL_OES_geometry_shader, 
    GL_OES_get_program_binary, GL_OES_gpu_shader5, GL_OES_mapbuffer, 
    GL_OES_packed_depth_stencil, GL_OES_primitive_bounding_box, 
    GL_OES_required_internalformat, GL_OES_rgb8_rgba8, GL_OES_sample_shading, 
    GL_OES_sample_variables, GL_OES_shader_image_atomic, 
    GL_OES_shader_io_blocks, GL_OES_shader_multisample_interpolation, 
    GL_OES_standard_derivatives, GL_OES_stencil8, GL_OES_surfaceless_context, 
    GL_OES_tessellation_point_size, GL_OES_tessellation_shader, 
    GL_OES_texture_3D, GL_OES_texture_border_clamp, GL_OES_texture_buffer, 
    GL_OES_texture_cube_map_array, GL_OES_texture_float, 
    GL_OES_texture_float_linear, GL_OES_texture_half_float, 
    GL_OES_texture_half_float_linear, GL_OES_texture_npot, 
    GL_OES_texture_stencil8, GL_OES_texture_storage_multisample_2d_array, 
    GL_OES_texture_view, GL_OES_vertex_array_object, GL_OES_vertex_half_float, 
    GL_OES_viewport_array
Configurations:
     bf lv colorbuffer dp st  ms    vis   cav bi  renderable  supported
  id sz  l  r  g  b  a th cl ns b    id   eat nd gl es es2 vg surfaces 
---------------------------------------------------------------------
0x01 32  0 10 10 10  2  0  0  0 0 0x30335241--         y  y  y     win
0x02 32  0 10 10 10  2 16  0  0 0 0x30335241--         y  y  y     win
0x03 32  0 10 10 10  2 24  0  0 0 0x30335241--         y  y  y     win
0x04 32  0 10 10 10  2 24  8  0 0 0x30335241--         y  y  y     win
0x05 32  0 10 10 10  2  0  0  2 1 0x30335241--         y  y  y     win
0x06 32  0 10 10 10  2  0  0  4 1 0x30335241--         y  y  y     win
0x07 32  0 10 10 10  2  0  0  8 1 0x30335241--         y  y  y     win
0x08 32  0 10 10 10  2  0  0 16 1 0x30335241--         y  y  y     win
0x09 32  0 10 10 10  2 16  0  2 1 0x30335241--         y  y  y     win
0x0a 32  0 10 10 10  2 16  0  4 1 0x30335241--         y  y  y     win
0x0b 32  0 10 10 10  2 16  0  8 1 0x30335241--         y  y  y     win
0x0c 32  0 10 10 10  2 16  0 16 1 0x30335241--         y  y  y     win
0x0d 32  0 10 10 10  2 24  0  2 1 0x30335241--         y  y  y     win
0x0e 32  0 10 10 10  2 24  0  4 1 0x30335241--         y  y  y     win
0x0f 32  0 10 10 10  2 24  0  8 1 0x30335241--         y  y  y     win
0x10 32  0 10 10 10  2 24  0 16 1 0x30335241--         y  y  y     win
0x11 32  0 10 10 10  2 24  8  2 1 0x30335241--         y  y  y     win
0x12 32  0 10 10 10  2 24  8  4 1 0x30335241--         y  y  y     win
0x13 32  0 10 10 10  2 24  8  8 1 0x30335241--         y  y  y     win
0x14 32  0 10 10 10  2 24  8 16 1 0x30335241--         y  y  y     win
0x15 30  0 10 10 10  0  0  0  0 0 0x30335258--         y  y  y     win
0x16 30  0 10 10 10  0 16  0  0 0 0x30335258--         y  y  y     win
0x17 30  0 10 10 10  0 24  0  0 0 0x30335258--         y  y  y     win
0x18 30  0 10 10 10  0 24  8  0 0 0x30335258--         y  y  y     win
0x19 30  0 10 10 10  0  0  0  2 1 0x30335258--         y  y  y     win
0x1a 30  0 10 10 10  0  0  0  4 1 0x30335258--         y  y  y     win
0x1b 30  0 10 10 10  0  0  0  8 1 0x30335258--         y  y  y     win
0x1c 30  0 10 10 10  0  0  0 16 1 0x30335258--         y  y  y     win
0x1d 30  0 10 10 10  0 16  0  2 1 0x30335258--         y  y  y     win
0x1e 30  0 10 10 10  0 16  0  4 1 0x30335258--         y  y  y     win
0x1f 30  0 10 10 10  0 16  0  8 1 0x30335258--         y  y  y     win
0x20 30  0 10 10 10  0 16  0 16 1 0x30335258--         y  y  y     win
0x21 30  0 10 10 10  0 24  0  2 1 0x30335258--         y  y  y     win
0x22 30  0 10 10 10  0 24  0  4 1 0x30335258--         y  y  y     win
0x23 30  0 10 10 10  0 24  0  8 1 0x30335258--         y  y  y     win
0x24 30  0 10 10 10  0 24  0 16 1 0x30335258--         y  y  y     win
0x25 30  0 10 10 10  0 24  8  2 1 0x30335258--         y  y  y     win
0x26 30  0 10 10 10  0 24  8  4 1 0x30335258--         y  y  y     win
0x27 30  0 10 10 10  0 24  8  8 1 0x30335258--         y  y  y     win
0x28 30  0 10 10 10  0 24  8 16 1 0x30335258--         y  y  y     win
0x29 32  0  8  8  8  8  0  0  0 0 0x34325241--         y  y  y     win
0x2a 32  0  8  8  8  8 16  0  0 0 0x34325241--         y  y  y     win
0x2b 32  0  8  8  8  8 24  0  0 0 0x34325241--         y  y  y     win
0x2c 32  0  8  8  8  8 24  8  0 0 0x34325241--         y  y  y     win
0x2d 32  0  8  8  8  8  0  0  2 1 0x34325241--         y  y  y     win
0x2e 32  0  8  8  8  8  0  0  4 1 0x34325241--         y  y  y     win
0x2f 32  0  8  8  8  8  0  0  8 1 0x34325241--         y  y  y     win
0x30 32  0  8  8  8  8  0  0 16 1 0x34325241--         y  y  y     win
0x31 32  0  8  8  8  8 16  0  2 1 0x34325241--         y  y  y     win
0x32 32  0  8  8  8  8 16  0  4 1 0x34325241--         y  y  y     win
0x33 32  0  8  8  8  8 16  0  8 1 0x34325241--         y  y  y     win
0x34 32  0  8  8  8  8 16  0 16 1 0x34325241--         y  y  y     win
0x35 32  0  8  8  8  8 24  0  2 1 0x34325241--         y  y  y     win
0x36 32  0  8  8  8  8 24  0  4 1 0x34325241--         y  y  y     win
0x37 32  0  8  8  8  8 24  0  8 1 0x34325241--         y  y  y     win
0x38 32  0  8  8  8  8 24  0 16 1 0x34325241--         y  y  y     win
0x39 32  0  8  8  8  8 24  8  2 1 0x34325241--         y  y  y     win
0x3a 32  0  8  8  8  8 24  8  4 1 0x34325241--         y  y  y     win
0x3b 32  0  8  8  8  8 24  8  8 1 0x34325241--         y  y  y     win
0x3c 32  0  8  8  8  8 24  8 16 1 0x34325241--         y  y  y     win
0x3d 24  0  8  8  8  0  0  0  0 0 0x34325258--         y  y  y     win
0x3e 24  0  8  8  8  0 16  0  0 0 0x34325258--         y  y  y     win
0x3f 24  0  8  8  8  0 24  0  0 0 0x34325258--         y  y  y     win
0x40 24  0  8  8  8  0 24  8  0 0 0x34325258--         y  y  y     win
0x41 24  0  8  8  8  0  0  0  2 1 0x34325258--         y  y  y     win
0x42 24  0  8  8  8  0  0  0  4 1 0x34325258--         y  y  y     win
0x43 24  0  8  8  8  0  0  0  8 1 0x34325258--         y  y  y     win
0x44 24  0  8  8  8  0  0  0 16 1 0x34325258--         y  y  y     win
0x45 24  0  8  8  8  0 16  0  2 1 0x34325258--         y  y  y     win
0x46 24  0  8  8  8  0 16  0  4 1 0x34325258--         y  y  y     win
0x47 24  0  8  8  8  0 16  0  8 1 0x34325258--         y  y  y     win
0x48 24  0  8  8  8  0 16  0 16 1 0x34325258--         y  y  y     win
0x49 24  0  8  8  8  0 24  0  2 1 0x34325258--         y  y  y     win
0x4a 24  0  8  8  8  0 24  0  4 1 0x34325258--         y  y  y     win
0x4b 24  0  8  8  8  0 24  0  8 1 0x34325258--         y  y  y     win
0x4c 24  0  8  8  8  0 24  0 16 1 0x34325258--         y  y  y     win
0x4d 24  0  8  8  8  0 24  8  2 1 0x34325258--         y  y  y     win
0x4e 24  0  8  8  8  0 24  8  4 1 0x34325258--         y  y  y     win
0x4f 24  0  8  8  8  0 24  8  8 1 0x34325258--         y  y  y     win
0x50 24  0  8  8  8  0 24  8 16 1 0x34325258--         y  y  y     win
0x51 16  0  5  6  5  0  0  0  0 0 0x36314752--         y  y  y     win
0x52 16  0  5  6  5  0 16  0  0 0 0x36314752--         y  y  y     win
0x53 16  0  5  6  5  0 24  0  0 0 0x36314752--         y  y  y     win
0x54 16  0  5  6  5  0 24  8  0 0 0x36314752--         y  y  y     win
0x55 16  0  5  6  5  0  0  0  2 1 0x36314752--         y  y  y     win
0x56 16  0  5  6  5  0  0  0  4 1 0x36314752--         y  y  y     win
0x57 16  0  5  6  5  0  0  0  8 1 0x36314752--         y  y  y     win
0x58 16  0  5  6  5  0  0  0 16 1 0x36314752--         y  y  y     win
0x59 16  0  5  6  5  0 16  0  2 1 0x36314752--         y  y  y     win
0x5a 16  0  5  6  5  0 16  0  4 1 0x36314752--         y  y  y     win
0x5b 16  0  5  6  5  0 16  0  8 1 0x36314752--         y  y  y     win
0x5c 16  0  5  6  5  0 16  0 16 1 0x36314752--         y  y  y     win
0x5d 16  0  5  6  5  0 24  0  2 1 0x36314752--         y  y  y     win
0x5e 16  0  5  6  5  0 24  0  4 1 0x36314752--         y  y  y     win
0x5f 16  0  5  6  5  0 24  0  8 1 0x36314752--         y  y  y     win
0x60 16  0  5  6  5  0 24  0 16 1 0x36314752--         y  y  y     win
0x61 16  0  5  6  5  0 24  8  2 1 0x36314752--         y  y  y     win
0x62 16  0  5  6  5  0 24  8  4 1 0x36314752--         y  y  y     win
0x63 16  0  5  6  5  0 24  8  8 1 0x36314752--         y  y  y     win
0x64 16  0  5  6  5  0 24  8 16 1 0x36314752--         y  y  y     win
0x65 64  0 16 16 16 16  0  0  0 0 0x48344241--         y  y  y     win
0x66 64  0 16 16 16 16 16  0  0 0 0x48344241--         y  y  y     win
0x67 64  0 16 16 16 16 24  0  0 0 0x48344241--         y  y  y     win
0x68 64  0 16 16 16 16 24  8  0 0 0x48344241--         y  y  y     win
0x69 64  0 16 16 16 16  0  0  2 1 0x48344241--         y  y  y     win
0x6a 64  0 16 16 16 16  0  0  4 1 0x48344241--         y  y  y     win
0x6b 64  0 16 16 16 16  0  0  8 1 0x48344241--         y  y  y     win
0x6c 64  0 16 16 16 16  0  0 16 1 0x48344241--         y  y  y     win
0x6d 64  0 16 16 16 16 16  0  2 1 0x48344241--         y  y  y     win
0x6e 64  0 16 16 16 16 16  0  4 1 0x48344241--         y  y  y     win
0x6f 64  0 16 16 16 16 16  0  8 1 0x48344241--         y  y  y     win
0x70 64  0 16 16 16 16 16  0 16 1 0x48344241--         y  y  y     win
0x71 64  0 16 16 16 16 24  0  2 1 0x48344241--         y  y  y     win
0x72 64  0 16 16 16 16 24  0  4 1 0x48344241--         y  y  y     win
0x73 64  0 16 16 16 16 24  0  8 1 0x48344241--         y  y  y     win
0x74 64  0 16 16 16 16 24  0 16 1 0x48344241--         y  y  y     win
0x75 64  0 16 16 16 16 24  8  2 1 0x48344241--         y  y  y     win
0x76 64  0 16 16 16 16 24  8  4 1 0x48344241--         y  y  y     win
0x77 64  0 16 16 16 16 24  8  8 1 0x48344241--         y  y  y     win
0x78 64  0 16 16 16 16 24  8 16 1 0x48344241--         y  y  y     win
0x79 48  0 16 16 16  0  0  0  0 0 0x48344258--         y  y  y     win
0x7a 48  0 16 16 16  0 16  0  0 0 0x48344258--         y  y  y     win
0x7b 48  0 16 16 16  0 24  0  0 0 0x48344258--         y  y  y     win
0x7c 48  0 16 16 16  0 24  8  0 0 0x48344258--         y  y  y     win
0x7d 48  0 16 16 16  0  0  0  2 1 0x48344258--         y  y  y     win
0x7e 48  0 16 16 16  0  0  0  4 1 0x48344258--         y  y  y     win
0x7f 48  0 16 16 16  0  0  0  8 1 0x48344258--         y  y  y     win
0x80 48  0 16 16 16  0  0  0 16 1 0x48344258--         y  y  y     win
0x81 48  0 16 16 16  0 16  0  2 1 0x48344258--         y  y  y     win
0x82 48  0 16 16 16  0 16  0  4 1 0x48344258--         y  y  y     win
0x83 48  0 16 16 16  0 16  0  8 1 0x48344258--         y  y  y     win
0x84 48  0 16 16 16  0 16  0 16 1 0x48344258--         y  y  y     win
0x85 48  0 16 16 16  0 24  0  2 1 0x48344258--         y  y  y     win
0x86 48  0 16 16 16  0 24  0  4 1 0x48344258--         y  y  y     win
0x87 48  0 16 16 16  0 24  0  8 1 0x48344258--         y  y  y     win
0x88 48  0 16 16 16  0 24  0 16 1 0x48344258--         y  y  y     win
0x89 48  0 16 16 16  0 24  8  2 1 0x48344258--         y  y  y     win
0x8a 48  0 16 16 16  0 24  8  4 1 0x48344258--         y  y  y     win
0x8b 48  0 16 16 16  0 24  8  8 1 0x48344258--         y  y  y     win
0x8c 48  0 16 16 16  0 24  8 16 1 0x48344258--         y  y  y     win

Wayland platform:
EGL API version: 1.5
EGL vendor string: Mesa Project
EGL version string: 1.5
EGL client APIs: OpenGL OpenGL_ES 
EGL driver name: radeonsi
EGL extensions string:
    EGL_ANDROID_blob_cache, EGL_ANDROID_native_fence_sync, EGL_EXT_buffer_age, 
    EGL_EXT_create_context_robustness, EGL_EXT_image_dma_buf_import, 
    EGL_EXT_image_dma_buf_import_modifiers, EGL_EXT_pixel_format_float, 
    EGL_EXT_present_opaque, EGL_EXT_swap_buffers_with_damage, 
    EGL_IMG_context_priority, EGL_KHR_cl_event2, EGL_KHR_config_attribs, 
    EGL_KHR_context_flush_control, EGL_KHR_create_context, 
    EGL_KHR_create_context_no_error, EGL_KHR_fence_sync, 
    EGL_KHR_get_all_proc_addresses, EGL_KHR_gl_colorspace, 
    EGL_KHR_gl_renderbuffer_image, EGL_KHR_gl_texture_2D_image, 
    EGL_KHR_gl_texture_3D_image, EGL_KHR_gl_texture_cubemap_image, 
    EGL_KHR_image_base, EGL_KHR_no_config_context, EGL_KHR_reusable_sync, 
    EGL_KHR_surfaceless_context, EGL_KHR_swap_buffers_with_damage, 
    EGL_KHR_wait_sync, EGL_MESA_configless_context, EGL_MESA_drm_image, 
    EGL_MESA_image_dma_buf_export, EGL_MESA_query_driver, 
    EGL_WL_bind_wayland_display, EGL_WL_create_wayland_buffer_from_image
OpenGL core profile vendor: AMD
OpenGL core profile renderer: AMD Radeon RX 5500 XT (navi14, LLVM 15.0.7, DRM 3.52, 6.3.9-arch1-1)
OpenGL core profile version: 4.6 (Core Profile) Mesa 23.1.3
OpenGL core profile shading language version: 4.60
OpenGL core profile extensions:
    GL_AMD_conservative_depth, GL_AMD_depth_clamp_separate, 
    GL_AMD_draw_buffers_blend, GL_AMD_framebuffer_multisample_advanced, 
    GL_AMD_gpu_shader_int64, GL_AMD_multi_draw_indirect, 
    GL_AMD_performance_monitor, GL_AMD_pinned_memory, 
    GL_AMD_query_buffer_object, GL_AMD_seamless_cubemap_per_texture, 
    GL_AMD_shader_stencil_export, GL_AMD_shader_trinary_minmax, 
    GL_AMD_texture_texture4, GL_AMD_vertex_shader_layer, 
    GL_AMD_vertex_shader_viewport_index, GL_ANGLE_texture_compression_dxt3, 
    GL_ANGLE_texture_compression_dxt5, GL_ARB_ES2_compatibility, 
    GL_ARB_ES3_1_compatibility, GL_ARB_ES3_2_compatibility, 
    GL_ARB_ES3_compatibility, GL_ARB_arrays_of_arrays, GL_ARB_base_instance, 
    GL_ARB_bindless_texture, GL_ARB_blend_func_extended, 
    GL_ARB_buffer_storage, GL_ARB_clear_buffer_object, GL_ARB_clear_texture, 
    GL_ARB_clip_control, GL_ARB_color_buffer_float, 
    GL_ARB_compressed_texture_pixel_storage, GL_ARB_compute_shader, 
    GL_ARB_compute_variable_group_size, GL_ARB_conditional_render_inverted, 
    GL_ARB_conservative_depth, GL_ARB_copy_buffer, GL_ARB_copy_image, 
    GL_ARB_cull_distance, GL_ARB_debug_output, GL_ARB_depth_buffer_float, 
    GL_ARB_depth_clamp, GL_ARB_derivative_control, GL_ARB_direct_state_access, 
    GL_ARB_draw_buffers, GL_ARB_draw_buffers_blend, 
    GL_ARB_draw_elements_base_vertex, GL_ARB_draw_indirect, 
    GL_ARB_draw_instanced, GL_ARB_enhanced_layouts, 
    GL_ARB_explicit_attrib_location, GL_ARB_explicit_uniform_location, 
    GL_ARB_fragment_coord_conventions, GL_ARB_fragment_layer_viewport, 
    GL_ARB_fragment_shader, GL_ARB_framebuffer_no_attachments, 
    GL_ARB_framebuffer_object, GL_ARB_framebuffer_sRGB, 
    GL_ARB_get_program_binary, GL_ARB_get_texture_sub_image, GL_ARB_gl_spirv, 
    GL_ARB_gpu_shader5, GL_ARB_gpu_shader_fp64, GL_ARB_gpu_shader_int64, 
    GL_ARB_half_float_pixel, GL_ARB_half_float_vertex, 
    GL_ARB_indirect_parameters, GL_ARB_instanced_arrays, 
    GL_ARB_internalformat_query, GL_ARB_internalformat_query2, 
    GL_ARB_invalidate_subdata, GL_ARB_map_buffer_alignment, 
    GL_ARB_map_buffer_range, GL_ARB_multi_bind, GL_ARB_multi_draw_indirect, 
    GL_ARB_occlusion_query2, GL_ARB_parallel_shader_compile, 
    GL_ARB_pipeline_statistics_query, GL_ARB_pixel_buffer_object, 
    GL_ARB_point_sprite, GL_ARB_polygon_offset_clamp, 
    GL_ARB_post_depth_coverage, GL_ARB_program_interface_query, 
    GL_ARB_provoking_vertex, GL_ARB_query_buffer_object, 
    GL_ARB_robust_buffer_access_behavior, GL_ARB_robustness, 
    GL_ARB_sample_shading, GL_ARB_sampler_objects, GL_ARB_seamless_cube_map, 
    GL_ARB_seamless_cubemap_per_texture, GL_ARB_separate_shader_objects, 
    GL_ARB_shader_atomic_counter_ops, GL_ARB_shader_atomic_counters, 
    GL_ARB_shader_ballot, GL_ARB_shader_bit_encoding, GL_ARB_shader_clock, 
    GL_ARB_shader_draw_parameters, GL_ARB_shader_group_vote, 
    GL_ARB_shader_image_load_store, GL_ARB_shader_image_size, 
    GL_ARB_shader_objects, GL_ARB_shader_precision, 
    GL_ARB_shader_stencil_export, GL_ARB_shader_storage_buffer_object, 
    GL_ARB_shader_subroutine, GL_ARB_shader_texture_image_samples, 
    GL_ARB_shader_texture_lod, GL_ARB_shader_viewport_layer_array, 
    GL_ARB_shading_language_420pack, GL_ARB_shading_language_include, 
    GL_ARB_shading_language_packing, GL_ARB_sparse_buffer, 
    GL_ARB_sparse_texture, GL_ARB_sparse_texture2, 
    GL_ARB_sparse_texture_clamp, GL_ARB_spirv_extensions, 
    GL_ARB_stencil_texturing, GL_ARB_sync, GL_ARB_tessellation_shader, 
    GL_ARB_texture_barrier, GL_ARB_texture_buffer_object, 
    GL_ARB_texture_buffer_object_rgb32, GL_ARB_texture_buffer_range, 
    GL_ARB_texture_compression_bptc, GL_ARB_texture_compression_rgtc, 
    GL_ARB_texture_cube_map_array, GL_ARB_texture_filter_anisotropic, 
    GL_ARB_texture_float, GL_ARB_texture_gather, 
    GL_ARB_texture_mirror_clamp_to_edge, GL_ARB_texture_multisample, 
    GL_ARB_texture_non_power_of_two, GL_ARB_texture_query_levels, 
    GL_ARB_texture_query_lod, GL_ARB_texture_rectangle, GL_ARB_texture_rg, 
    GL_ARB_texture_rgb10_a2ui, GL_ARB_texture_stencil8, 
    GL_ARB_texture_storage, GL_ARB_texture_storage_multisample, 
    GL_ARB_texture_swizzle, GL_ARB_texture_view, GL_ARB_timer_query, 
    GL_ARB_transform_feedback2, GL_ARB_transform_feedback3, 
    GL_ARB_transform_feedback_instanced, 
    GL_ARB_transform_feedback_overflow_query, GL_ARB_uniform_buffer_object, 
    GL_ARB_vertex_array_bgra, GL_ARB_vertex_array_object, 
    GL_ARB_vertex_attrib_64bit, GL_ARB_vertex_attrib_binding, 
    GL_ARB_vertex_buffer_object, GL_ARB_vertex_shader, 
    GL_ARB_vertex_type_10f_11f_11f_rev, GL_ARB_vertex_type_2_10_10_10_rev, 
    GL_ARB_viewport_array, GL_ATI_blend_equation_separate, GL_ATI_meminfo, 
    GL_ATI_texture_float, GL_ATI_texture_mirror_once, 
    GL_EXT_EGL_image_storage, GL_EXT_EGL_sync, GL_EXT_abgr, 
    GL_EXT_blend_equation_separate, GL_EXT_debug_label, 
    GL_EXT_demote_to_helper_invocation, GL_EXT_depth_bounds_test, 
    GL_EXT_draw_buffers2, GL_EXT_draw_instanced, GL_EXT_framebuffer_blit, 
    GL_EXT_framebuffer_multisample, GL_EXT_framebuffer_multisample_blit_scaled, 
    GL_EXT_framebuffer_object, GL_EXT_framebuffer_sRGB, GL_EXT_memory_object, 
    GL_EXT_memory_object_fd, GL_EXT_packed_depth_stencil, GL_EXT_packed_float, 
    GL_EXT_pixel_buffer_object, GL_EXT_polygon_offset_clamp, 
    GL_EXT_provoking_vertex, GL_EXT_semaphore, GL_EXT_semaphore_fd, 
    GL_EXT_shader_image_load_formatted, GL_EXT_shader_image_load_store, 
    GL_EXT_shader_integer_mix, GL_EXT_shader_samples_identical, 
    GL_EXT_texture_array, GL_EXT_texture_compression_dxt1, 
    GL_EXT_texture_compression_rgtc, GL_EXT_texture_compression_s3tc, 
    GL_EXT_texture_filter_anisotropic, GL_EXT_texture_integer, 
    GL_EXT_texture_mirror_clamp, GL_EXT_texture_sRGB, GL_EXT_texture_sRGB_R8, 
    GL_EXT_texture_sRGB_RG8, GL_EXT_texture_sRGB_decode, 
    GL_EXT_texture_shadow_lod, GL_EXT_texture_shared_exponent, 
    GL_EXT_texture_snorm, GL_EXT_texture_swizzle, GL_EXT_timer_query, 
    GL_EXT_transform_feedback, GL_EXT_vertex_array_bgra, 
    GL_EXT_vertex_attrib_64bit, GL_EXT_window_rectangles, 
    GL_IBM_multimode_draw_arrays, GL_INTEL_blackhole_render, 
    GL_KHR_blend_equation_advanced, GL_KHR_context_flush_control, 
    GL_KHR_debug, GL_KHR_no_error, GL_KHR_parallel_shader_compile, 
    GL_KHR_robust_buffer_access_behavior, GL_KHR_robustness, 
    GL_KHR_texture_compression_astc_ldr, 
    GL_KHR_texture_compression_astc_sliced_3d, GL_MESA_framebuffer_flip_y, 
    GL_MESA_pack_invert, GL_MESA_shader_integer_functions, 
    GL_MESA_texture_signed_rgba, GL_NVX_gpu_memory_info, 
    GL_NV_alpha_to_coverage_dither_control, GL_NV_compute_shader_derivatives, 
    GL_NV_conditional_render, GL_NV_copy_image, GL_NV_depth_clamp, 
    GL_NV_packed_depth_stencil, GL_NV_shader_atomic_int64, 
    GL_NV_texture_barrier, GL_NV_vdpau_interop, GL_OES_EGL_image, GL_S3_s3tc
Memory info (GL_ATI_meminfo):
    VBO free memory - total: 2522 MB, largest block: 2522 MB
    VBO free aux. memory - total: 15858 MB, largest block: 15858 MB
    Texture free memory - total: 2522 MB, largest block: 2522 MB
    Texture free aux. memory - total: 15858 MB, largest block: 15858 MB
    Renderbuffer free memory - total: 2522 MB, largest block: 2522 MB
    Renderbuffer free aux. memory - total: 15858 MB, largest block: 15858 MB
Memory info (GL_NVX_gpu_memory_info):
    Dedicated video memory: 4096 MB
    Total available memory: 20077 MB
    Currently available dedicated video memory: 2522 MB
OpenGL compatibility profile vendor: AMD
OpenGL compatibility profile renderer: AMD Radeon RX 5500 XT (navi14, LLVM 15.0.7, DRM 3.52, 6.3.9-arch1-1)
OpenGL compatibility profile version: 4.6 (Compatibility Profile) Mesa 23.1.3
OpenGL compatibility profile shading language version: 4.60
OpenGL compatibility profile extensions:
    GL_AMD_conservative_depth, GL_AMD_depth_clamp_separate, 
    GL_AMD_draw_buffers_blend, GL_AMD_framebuffer_multisample_advanced, 
    GL_AMD_multi_draw_indirect, GL_AMD_performance_monitor, 
    GL_AMD_pinned_memory, GL_AMD_query_buffer_object, 
    GL_AMD_seamless_cubemap_per_texture, GL_AMD_shader_stencil_export, 
    GL_AMD_shader_trinary_minmax, GL_AMD_texture_texture4, 
    GL_AMD_vertex_shader_layer, GL_AMD_vertex_shader_viewport_index, 
    GL_ANGLE_texture_compression_dxt3, GL_ANGLE_texture_compression_dxt5, 
    GL_APPLE_packed_pixels, GL_ARB_ES2_compatibility, 
    GL_ARB_ES3_1_compatibility, GL_ARB_ES3_2_compatibility, 
    GL_ARB_ES3_compatibility, GL_ARB_arrays_of_arrays, GL_ARB_base_instance, 
    GL_ARB_bindless_texture, GL_ARB_blend_func_extended, 
    GL_ARB_buffer_storage, GL_ARB_clear_buffer_object, GL_ARB_clear_texture, 
    GL_ARB_clip_control, GL_ARB_color_buffer_float, GL_ARB_compatibility, 
    GL_ARB_compressed_texture_pixel_storage, GL_ARB_compute_shader, 
    GL_ARB_compute_variable_group_size, GL_ARB_conditional_render_inverted, 
    GL_ARB_conservative_depth, GL_ARB_copy_buffer, GL_ARB_copy_image, 
    GL_ARB_cull_distance, GL_ARB_debug_output, GL_ARB_depth_buffer_float, 
    GL_ARB_depth_clamp, GL_ARB_depth_texture, GL_ARB_derivative_control, 
    GL_ARB_direct_state_access, GL_ARB_draw_buffers, 
    GL_ARB_draw_buffers_blend, GL_ARB_draw_elements_base_vertex, 
    GL_ARB_draw_indirect, GL_ARB_draw_instanced, GL_ARB_enhanced_layouts, 
    GL_ARB_explicit_attrib_location, GL_ARB_explicit_uniform_location, 
    GL_ARB_fragment_coord_conventions, GL_ARB_fragment_layer_viewport, 
    GL_ARB_fragment_program, GL_ARB_fragment_program_shadow, 
    GL_ARB_fragment_shader, GL_ARB_framebuffer_no_attachments, 
    GL_ARB_framebuffer_object, GL_ARB_framebuffer_sRGB, 
    GL_ARB_get_program_binary, GL_ARB_get_texture_sub_image, GL_ARB_gl_spirv, 
    GL_ARB_gpu_shader5, GL_ARB_gpu_shader_fp64, GL_ARB_gpu_shader_int64, 
    GL_ARB_half_float_pixel, GL_ARB_half_float_vertex, 
    GL_ARB_indirect_parameters, GL_ARB_instanced_arrays, 
    GL_ARB_internalformat_query, GL_ARB_internalformat_query2, 
    GL_ARB_invalidate_subdata, GL_ARB_map_buffer_alignment, 
    GL_ARB_map_buffer_range, GL_ARB_multi_bind, GL_ARB_multi_draw_indirect, 
    GL_ARB_multisample, GL_ARB_multitexture, GL_ARB_occlusion_query, 
    GL_ARB_occlusion_query2, GL_ARB_parallel_shader_compile, 
    GL_ARB_pipeline_statistics_query, GL_ARB_pixel_buffer_object, 
    GL_ARB_point_parameters, GL_ARB_point_sprite, GL_ARB_polygon_offset_clamp, 
    GL_ARB_post_depth_coverage, GL_ARB_program_interface_query, 
    GL_ARB_provoking_vertex, GL_ARB_query_buffer_object, 
    GL_ARB_robust_buffer_access_behavior, GL_ARB_robustness, 
    GL_ARB_sample_shading, GL_ARB_sampler_objects, GL_ARB_seamless_cube_map, 
    GL_ARB_seamless_cubemap_per_texture, GL_ARB_separate_shader_objects, 
    GL_ARB_shader_atomic_counter_ops, GL_ARB_shader_atomic_counters, 
    GL_ARB_shader_ballot, GL_ARB_shader_bit_encoding, GL_ARB_shader_clock, 
    GL_ARB_shader_draw_parameters, GL_ARB_shader_group_vote, 
    GL_ARB_shader_image_load_store, GL_ARB_shader_image_size, 
    GL_ARB_shader_objects, GL_ARB_shader_precision, 
    GL_ARB_shader_stencil_export, GL_ARB_shader_storage_buffer_object, 
    GL_ARB_shader_subroutine, GL_ARB_shader_texture_image_samples, 
    GL_ARB_shader_texture_lod, GL_ARB_shader_viewport_layer_array, 
    GL_ARB_shading_language_100, GL_ARB_shading_language_420pack, 
    GL_ARB_shading_language_include, GL_ARB_shading_language_packing, 
    GL_ARB_shadow, GL_ARB_sparse_buffer, GL_ARB_sparse_texture, 
    GL_ARB_sparse_texture2, GL_ARB_sparse_texture_clamp, 
    GL_ARB_spirv_extensions, GL_ARB_stencil_texturing, GL_ARB_sync, 
    GL_ARB_tessellation_shader, GL_ARB_texture_barrier, 
    GL_ARB_texture_border_clamp, GL_ARB_texture_buffer_object, 
    GL_ARB_texture_buffer_object_rgb32, GL_ARB_texture_buffer_range, 
    GL_ARB_texture_compression, GL_ARB_texture_compression_bptc, 
    GL_ARB_texture_compression_rgtc, GL_ARB_texture_cube_map, 
    GL_ARB_texture_cube_map_array, GL_ARB_texture_env_add, 
    GL_ARB_texture_env_combine, GL_ARB_texture_env_crossbar, 
    GL_ARB_texture_env_dot3, GL_ARB_texture_filter_anisotropic, 
    GL_ARB_texture_float, GL_ARB_texture_gather, 
    GL_ARB_texture_mirror_clamp_to_edge, GL_ARB_texture_mirrored_repeat, 
    GL_ARB_texture_multisample, GL_ARB_texture_non_power_of_two, 
    GL_ARB_texture_query_levels, GL_ARB_texture_query_lod, 
    GL_ARB_texture_rectangle, GL_ARB_texture_rg, GL_ARB_texture_rgb10_a2ui, 
    GL_ARB_texture_stencil8, GL_ARB_texture_storage, 
    GL_ARB_texture_storage_multisample, GL_ARB_texture_swizzle, 
    GL_ARB_texture_view, GL_ARB_timer_query, GL_ARB_transform_feedback2, 
    GL_ARB_transform_feedback3, GL_ARB_transform_feedback_instanced, 
    GL_ARB_transform_feedback_overflow_query, GL_ARB_transpose_matrix, 
    GL_ARB_uniform_buffer_object, GL_ARB_vertex_array_bgra, 
    GL_ARB_vertex_array_object, GL_ARB_vertex_attrib_64bit, 
    GL_ARB_vertex_attrib_binding, GL_ARB_vertex_buffer_object, 
    GL_ARB_vertex_program, GL_ARB_vertex_shader, 
    GL_ARB_vertex_type_10f_11f_11f_rev, GL_ARB_vertex_type_2_10_10_10_rev, 
    GL_ARB_viewport_array, GL_ARB_window_pos, GL_ATI_blend_equation_separate, 
    GL_ATI_draw_buffers, GL_ATI_fragment_shader, GL_ATI_meminfo, 
    GL_ATI_separate_stencil, GL_ATI_texture_compression_3dc, 
    GL_ATI_texture_env_combine3, GL_ATI_texture_float, 
    GL_ATI_texture_mirror_once, GL_EXT_EGL_image_storage, GL_EXT_EGL_sync, 
    GL_EXT_abgr, GL_EXT_bgra, GL_EXT_blend_color, 
    GL_EXT_blend_equation_separate, GL_EXT_blend_func_separate, 
    GL_EXT_blend_minmax, GL_EXT_blend_subtract, GL_EXT_compiled_vertex_array, 
    GL_EXT_copy_texture, GL_EXT_debug_label, 
    GL_EXT_demote_to_helper_invocation, GL_EXT_depth_bounds_test, 
    GL_EXT_direct_state_access, GL_EXT_draw_buffers2, GL_EXT_draw_instanced, 
    GL_EXT_draw_range_elements, GL_EXT_fog_coord, GL_EXT_framebuffer_blit, 
    GL_EXT_framebuffer_multisample, GL_EXT_framebuffer_multisample_blit_scaled, 
    GL_EXT_framebuffer_object, GL_EXT_framebuffer_sRGB, 
    GL_EXT_gpu_program_parameters, GL_EXT_gpu_shader4, GL_EXT_memory_object, 
    GL_EXT_memory_object_fd, GL_EXT_multi_draw_arrays, 
    GL_EXT_packed_depth_stencil, GL_EXT_packed_float, GL_EXT_packed_pixels, 
    GL_EXT_pixel_buffer_object, GL_EXT_point_parameters, 
    GL_EXT_polygon_offset_clamp, GL_EXT_provoking_vertex, 
    GL_EXT_rescale_normal, GL_EXT_secondary_color, GL_EXT_semaphore, 
    GL_EXT_semaphore_fd, GL_EXT_separate_specular_color, 
    GL_EXT_shader_image_load_formatted, GL_EXT_shader_image_load_store, 
    GL_EXT_shader_integer_mix, GL_EXT_shader_samples_identical, 
    GL_EXT_shadow_funcs, GL_EXT_stencil_two_side, GL_EXT_stencil_wrap, 
    GL_EXT_subtexture, GL_EXT_texture, GL_EXT_texture3D, 
    GL_EXT_texture_array, GL_EXT_texture_buffer_object, 
    GL_EXT_texture_compression_dxt1, GL_EXT_texture_compression_latc, 
    GL_EXT_texture_compression_rgtc, GL_EXT_texture_compression_s3tc, 
    GL_EXT_texture_cube_map, GL_EXT_texture_edge_clamp, 
    GL_EXT_texture_env_add, GL_EXT_texture_env_combine, 
    GL_EXT_texture_env_dot3, GL_EXT_texture_filter_anisotropic, 
    GL_EXT_texture_integer, GL_EXT_texture_lod_bias, 
    GL_EXT_texture_mirror_clamp, GL_EXT_texture_object, 
    GL_EXT_texture_rectangle, GL_EXT_texture_sRGB, GL_EXT_texture_sRGB_R8, 
    GL_EXT_texture_sRGB_RG8, GL_EXT_texture_sRGB_decode, 
    GL_EXT_texture_shadow_lod, GL_EXT_texture_shared_exponent, 
    GL_EXT_texture_snorm, GL_EXT_texture_swizzle, GL_EXT_timer_query, 
    GL_EXT_transform_feedback, GL_EXT_vertex_array, GL_EXT_vertex_array_bgra, 
    GL_EXT_vertex_attrib_64bit, GL_EXT_window_rectangles, 
    GL_IBM_multimode_draw_arrays, GL_IBM_rasterpos_clip, 
    GL_IBM_texture_mirrored_repeat, GL_INGR_blend_func_separate, 
    GL_INTEL_blackhole_render, GL_KHR_blend_equation_advanced, 
    GL_KHR_context_flush_control, GL_KHR_debug, GL_KHR_no_error, 
    GL_KHR_parallel_shader_compile, GL_KHR_robust_buffer_access_behavior, 
    GL_KHR_robustness, GL_KHR_texture_compression_astc_ldr, 
    GL_KHR_texture_compression_astc_sliced_3d, GL_MESA_framebuffer_flip_y, 
    GL_MESA_pack_invert, GL_MESA_shader_integer_functions, 
    GL_MESA_texture_signed_rgba, GL_MESA_window_pos, GL_NVX_gpu_memory_info, 
    GL_NV_ES1_1_compatibility, GL_NV_alpha_to_coverage_dither_control, 
    GL_NV_blend_square, GL_NV_compute_shader_derivatives, 
    GL_NV_conditional_render, GL_NV_copy_depth_to_color, GL_NV_copy_image, 
    GL_NV_depth_clamp, GL_NV_fog_distance, GL_NV_half_float, 
    GL_NV_light_max_exponent, GL_NV_packed_depth_stencil, 
    GL_NV_primitive_restart, GL_NV_shader_atomic_int64, 
    GL_NV_texgen_reflection, GL_NV_texture_barrier, 
    GL_NV_texture_env_combine4, GL_NV_texture_rectangle, GL_NV_vdpau_interop, 
    GL_OES_EGL_image, GL_OES_read_format, GL_S3_s3tc, 
    GL_SGIS_generate_mipmap, GL_SGIS_texture_border_clamp, 
    GL_SGIS_texture_edge_clamp, GL_SGIS_texture_lod, GL_SUN_multi_draw_arrays
Memory info (GL_ATI_meminfo):
    VBO free memory - total: 2522 MB, largest block: 2522 MB
    VBO free aux. memory - total: 15858 MB, largest block: 15858 MB
    Texture free memory - total: 2522 MB, largest block: 2522 MB
    Texture free aux. memory - total: 15858 MB, largest block: 15858 MB
    Renderbuffer free memory - total: 2522 MB, largest block: 2522 MB
    Renderbuffer free aux. memory - total: 15858 MB, largest block: 15858 MB
Memory info (GL_NVX_gpu_memory_info):
    Dedicated video memory: 4096 MB
    Total available memory: 20077 MB
    Currently available dedicated video memory: 2522 MB
OpenGL ES profile vendor: AMD
OpenGL ES profile renderer: AMD Radeon RX 5500 XT (navi14, LLVM 15.0.7, DRM 3.52, 6.3.9-arch1-1)
OpenGL ES profile version: OpenGL ES 3.2 Mesa 23.1.3
OpenGL ES profile shading language version: OpenGL ES GLSL ES 3.20
OpenGL ES profile extensions:
    GL_AMD_framebuffer_multisample_advanced, GL_AMD_performance_monitor, 
    GL_ANDROID_extension_pack_es31a, GL_ANGLE_pack_reverse_row_order, 
    GL_ANGLE_texture_compression_dxt3, GL_ANGLE_texture_compression_dxt5, 
    GL_APPLE_texture_max_level, GL_EXT_EGL_image_storage, 
    GL_EXT_base_instance, GL_EXT_blend_func_extended, GL_EXT_blend_minmax, 
    GL_EXT_buffer_storage, GL_EXT_clear_texture, GL_EXT_clip_control, 
    GL_EXT_clip_cull_distance, GL_EXT_color_buffer_float, 
    GL_EXT_color_buffer_half_float, GL_EXT_compressed_ETC1_RGB8_sub_texture, 
    GL_EXT_copy_image, GL_EXT_debug_label, GL_EXT_demote_to_helper_invocation, 
    GL_EXT_depth_clamp, GL_EXT_discard_framebuffer, 
    GL_EXT_disjoint_timer_query, GL_EXT_draw_buffers, 
    GL_EXT_draw_buffers_indexed, GL_EXT_draw_elements_base_vertex, 
    GL_EXT_draw_instanced, GL_EXT_float_blend, GL_EXT_frag_depth, 
    GL_EXT_geometry_point_size, GL_EXT_geometry_shader, GL_EXT_gpu_shader5, 
    GL_EXT_instanced_arrays, GL_EXT_map_buffer_range, GL_EXT_memory_object, 
    GL_EXT_memory_object_fd, GL_EXT_multi_draw_arrays, 
    GL_EXT_occlusion_query_boolean, GL_EXT_polygon_offset_clamp, 
    GL_EXT_primitive_bounding_box, GL_EXT_read_format_bgra, 
    GL_EXT_render_snorm, GL_EXT_robustness, GL_EXT_sRGB_write_control, 
    GL_EXT_semaphore, GL_EXT_semaphore_fd, GL_EXT_separate_shader_objects, 
    GL_EXT_shader_group_vote, GL_EXT_shader_implicit_conversions, 
    GL_EXT_shader_integer_mix, GL_EXT_shader_io_blocks, 
    GL_EXT_shader_samples_identical, GL_EXT_tessellation_point_size, 
    GL_EXT_tessellation_shader, GL_EXT_texture_border_clamp, 
    GL_EXT_texture_buffer, GL_EXT_texture_compression_bptc, 
    GL_EXT_texture_compression_dxt1, GL_EXT_texture_compression_rgtc, 
    GL_EXT_texture_compression_s3tc, GL_EXT_texture_compression_s3tc_srgb, 
    GL_EXT_texture_cube_map_array, GL_EXT_texture_filter_anisotropic, 
    GL_EXT_texture_format_BGRA8888, GL_EXT_texture_mirror_clamp_to_edge, 
    GL_EXT_texture_norm16, GL_EXT_texture_query_lod, GL_EXT_texture_rg, 
    GL_EXT_texture_sRGB_R8, GL_EXT_texture_sRGB_RG8, 
    GL_EXT_texture_sRGB_decode, GL_EXT_texture_shadow_lod, 
    GL_EXT_texture_type_2_10_10_10_REV, GL_EXT_texture_view, 
    GL_EXT_unpack_subimage, GL_EXT_window_rectangles, 
    GL_INTEL_blackhole_render, GL_KHR_blend_equation_advanced, 
    GL_KHR_context_flush_control, GL_KHR_debug, GL_KHR_no_error, 
    GL_KHR_parallel_shader_compile, GL_KHR_robust_buffer_access_behavior, 
    GL_KHR_robustness, GL_KHR_texture_compression_astc_ldr, 
    GL_KHR_texture_compression_astc_sliced_3d, GL_MESA_bgra, 
    GL_MESA_framebuffer_flip_y, GL_MESA_shader_integer_functions, 
    GL_NV_alpha_to_coverage_dither_control, GL_NV_compute_shader_derivatives, 
    GL_NV_conditional_render, GL_NV_draw_buffers, GL_NV_fbo_color_attachments, 
    GL_NV_generate_mipmap_sRGB, GL_NV_image_formats, GL_NV_pack_subimage, 
    GL_NV_pixel_buffer_object, GL_NV_read_buffer, GL_NV_read_depth, 
    GL_NV_read_depth_stencil, GL_NV_read_stencil, 
    GL_NV_shader_noperspective_interpolation, GL_OES_EGL_image, 
    GL_OES_EGL_image_external, GL_OES_EGL_image_external_essl3, 
    GL_OES_EGL_sync, GL_OES_compressed_ETC1_RGB8_texture, GL_OES_copy_image, 
    GL_OES_depth24, GL_OES_depth_texture, GL_OES_depth_texture_cube_map, 
    GL_OES_draw_buffers_indexed, GL_OES_draw_elements_base_vertex, 
    GL_OES_element_index_uint, GL_OES_fbo_render_mipmap, 
    GL_OES_geometry_point_size, GL_OES_geometry_shader, 
    GL_OES_get_program_binary, GL_OES_gpu_shader5, GL_OES_mapbuffer, 
    GL_OES_packed_depth_stencil, GL_OES_primitive_bounding_box, 
    GL_OES_required_internalformat, GL_OES_rgb8_rgba8, GL_OES_sample_shading, 
    GL_OES_sample_variables, GL_OES_shader_image_atomic, 
    GL_OES_shader_io_blocks, GL_OES_shader_multisample_interpolation, 
    GL_OES_standard_derivatives, GL_OES_stencil8, GL_OES_surfaceless_context, 
    GL_OES_tessellation_point_size, GL_OES_tessellation_shader, 
    GL_OES_texture_3D, GL_OES_texture_border_clamp, GL_OES_texture_buffer, 
    GL_OES_texture_cube_map_array, GL_OES_texture_float, 
    GL_OES_texture_float_linear, GL_OES_texture_half_float, 
    GL_OES_texture_half_float_linear, GL_OES_texture_npot, 
    GL_OES_texture_stencil8, GL_OES_texture_storage_multisample_2d_array, 
    GL_OES_texture_view, GL_OES_vertex_array_object, GL_OES_vertex_half_float, 
    GL_OES_viewport_array
Configurations:
     bf lv colorbuffer dp st  ms    vis   cav bi  renderable  supported
  id sz  l  r  g  b  a th cl ns b    id   eat nd gl es es2 vg surfaces 
---------------------------------------------------------------------
0x01 32  0 10 10 10  2  0  0  0 0 0x00--         y  y  y     win
0x02 32  0 10 10 10  2 16  0  0 0 0x00--         y  y  y     win
0x03 32  0 10 10 10  2 24  0  0 0 0x00--         y  y  y     win
0x04 32  0 10 10 10  2 24  8  0 0 0x00--         y  y  y     win
0x05 32  0 10 10 10  2  0  0  2 1 0x00--         y  y  y     win
0x06 32  0 10 10 10  2  0  0  4 1 0x00--         y  y  y     win
0x07 32  0 10 10 10  2  0  0  8 1 0x00--         y  y  y     win
0x08 32  0 10 10 10  2 16  0  2 1 0x00--         y  y  y     win
0x09 32  0 10 10 10  2 16  0  4 1 0x00--         y  y  y     win
0x0a 32  0 10 10 10  2 16  0  8 1 0x00--         y  y  y     win
0x0b 32  0 10 10 10  2 24  0  2 1 0x00--         y  y  y     win
0x0c 32  0 10 10 10  2 24  0  4 1 0x00--         y  y  y     win
0x0d 32  0 10 10 10  2 24  0  8 1 0x00--         y  y  y     win
0x0e 32  0 10 10 10  2 24  8  2 1 0x00--         y  y  y     win
0x0f 32  0 10 10 10  2 24  8  4 1 0x00--         y  y  y     win
0x10 32  0 10 10 10  2 24  8  8 1 0x00--         y  y  y     win
0x11 30  0 10 10 10  0  0  0  0 0 0x00--         y  y  y     win
0x12 30  0 10 10 10  0 16  0  0 0 0x00--         y  y  y     win
0x13 30  0 10 10 10  0 24  0  0 0 0x00--         y  y  y     win
0x14 30  0 10 10 10  0 24  8  0 0 0x00--         y  y  y     win
0x15 30  0 10 10 10  0  0  0  2 1 0x00--         y  y  y     win
0x16 30  0 10 10 10  0  0  0  4 1 0x00--         y  y  y     win
0x17 30  0 10 10 10  0  0  0  8 1 0x00--         y  y  y     win
0x18 30  0 10 10 10  0 16  0  2 1 0x00--         y  y  y     win
0x19 30  0 10 10 10  0 16  0  4 1 0x00--         y  y  y     win
0x1a 30  0 10 10 10  0 16  0  8 1 0x00--         y  y  y     win
0x1b 30  0 10 10 10  0 24  0  2 1 0x00--         y  y  y     win
0x1c 30  0 10 10 10  0 24  0  4 1 0x00--         y  y  y     win
0x1d 30  0 10 10 10  0 24  0  8 1 0x00--         y  y  y     win
0x1e 30  0 10 10 10  0 24  8  2 1 0x00--         y  y  y     win
0x1f 30  0 10 10 10  0 24  8  4 1 0x00--         y  y  y     win
0x20 30  0 10 10 10  0 24  8  8 1 0x00--         y  y  y     win
0x21 32  0  8  8  8  8  0  0  0 0 0x00--         y  y  y     win
0x22 32  0  8  8  8  8 16  0  0 0 0x00--         y  y  y     win
0x23 32  0  8  8  8  8 24  0  0 0 0x00--         y  y  y     win
0x24 32  0  8  8  8  8 24  8  0 0 0x00--         y  y  y     win
0x25 32  0  8  8  8  8  0  0  2 1 0x00--         y  y  y     win
0x26 32  0  8  8  8  8  0  0  4 1 0x00--         y  y  y     win
0x27 32  0  8  8  8  8  0  0  8 1 0x00--         y  y  y     win
0x28 32  0  8  8  8  8 16  0  2 1 0x00--         y  y  y     win
0x29 32  0  8  8  8  8 16  0  4 1 0x00--         y  y  y     win
0x2a 32  0  8  8  8  8 16  0  8 1 0x00--         y  y  y     win
0x2b 32  0  8  8  8  8 24  0  2 1 0x00--         y  y  y     win
0x2c 32  0  8  8  8  8 24  0  4 1 0x00--         y  y  y     win
0x2d 32  0  8  8  8  8 24  0  8 1 0x00--         y  y  y     win
0x2e 32  0  8  8  8  8 24  8  2 1 0x00--         y  y  y     win
0x2f 32  0  8  8  8  8 24  8  4 1 0x00--         y  y  y     win
0x30 32  0  8  8  8  8 24  8  8 1 0x00--         y  y  y     win
0x31 24  0  8  8  8  0  0  0  0 0 0x00--         y  y  y     win
0x32 24  0  8  8  8  0 16  0  0 0 0x00--         y  y  y     win
0x33 24  0  8  8  8  0 24  0  0 0 0x00--         y  y  y     win
0x34 24  0  8  8  8  0 24  8  0 0 0x00--         y  y  y     win
0x35 24  0  8  8  8  0  0  0  2 1 0x00--         y  y  y     win
0x36 24  0  8  8  8  0  0  0  4 1 0x00--         y  y  y     win
0x37 24  0  8  8  8  0  0  0  8 1 0x00--         y  y  y     win
0x38 24  0  8  8  8  0 16  0  2 1 0x00--         y  y  y     win
0x39 24  0  8  8  8  0 16  0  4 1 0x00--         y  y  y     win
0x3a 24  0  8  8  8  0 16  0  8 1 0x00--         y  y  y     win
0x3b 24  0  8  8  8  0 24  0  2 1 0x00--         y  y  y     win
0x3c 24  0  8  8  8  0 24  0  4 1 0x00--         y  y  y     win
0x3d 24  0  8  8  8  0 24  0  8 1 0x00--         y  y  y     win
0x3e 24  0  8  8  8  0 24  8  2 1 0x00--         y  y  y     win
0x3f 24  0  8  8  8  0 24  8  4 1 0x00--         y  y  y     win
0x40 24  0  8  8  8  0 24  8  8 1 0x00--         y  y  y     win
0x41 16  0  5  6  5  0  0  0  0 0 0x00--         y  y  y     win
0x42 16  0  5  6  5  0 16  0  0 0 0x00--         y  y  y     win
0x43 16  0  5  6  5  0 24  0  0 0 0x00--         y  y  y     win
0x44 16  0  5  6  5  0 24  8  0 0 0x00--         y  y  y     win
0x45 16  0  5  6  5  0  0  0  2 1 0x00--         y  y  y     win
0x46 16  0  5  6  5  0  0  0  4 1 0x00--         y  y  y     win
0x47 16  0  5  6  5  0  0  0  8 1 0x00--         y  y  y     win
0x48 16  0  5  6  5  0 16  0  2 1 0x00--         y  y  y     win
0x49 16  0  5  6  5  0 16  0  4 1 0x00--         y  y  y     win
0x4a 16  0  5  6  5  0 16  0  8 1 0x00--         y  y  y     win
0x4b 16  0  5  6  5  0 24  0  2 1 0x00--         y  y  y     win
0x4c 16  0  5  6  5  0 24  0  4 1 0x00--         y  y  y     win
0x4d 16  0  5  6  5  0 24  0  8 1 0x00--         y  y  y     win
0x4e 16  0  5  6  5  0 24  8  2 1 0x00--         y  y  y     win
0x4f 16  0  5  6  5  0 24  8  4 1 0x00--         y  y  y     win
0x50 16  0  5  6  5  0 24  8  8 1 0x00--         y  y  y     win
0x51 64  0 16 16 16 16  0  0  0 0 0x00--         y  y  y     win
0x52 64  0 16 16 16 16 16  0  0 0 0x00--         y  y  y     win
0x53 64  0 16 16 16 16 24  0  0 0 0x00--         y  y  y     win
0x54 64  0 16 16 16 16 24  8  0 0 0x00--         y  y  y     win
0x55 64  0 16 16 16 16  0  0  2 1 0x00--         y  y  y     win
0x56 64  0 16 16 16 16  0  0  4 1 0x00--         y  y  y     win
0x57 64  0 16 16 16 16  0  0  8 1 0x00--         y  y  y     win
0x58 64  0 16 16 16 16 16  0  2 1 0x00--         y  y  y     win
0x59 64  0 16 16 16 16 16  0  4 1 0x00--         y  y  y     win
0x5a 64  0 16 16 16 16 16  0  8 1 0x00--         y  y  y     win
0x5b 64  0 16 16 16 16 24  0  2 1 0x00--         y  y  y     win
0x5c 64  0 16 16 16 16 24  0  4 1 0x00--         y  y  y     win
0x5d 64  0 16 16 16 16 24  0  8 1 0x00--         y  y  y     win
0x5e 64  0 16 16 16 16 24  8  2 1 0x00--         y  y  y     win
0x5f 64  0 16 16 16 16 24  8  4 1 0x00--         y  y  y     win
0x60 64  0 16 16 16 16 24  8  8 1 0x00--         y  y  y     win
0x61 48  0 16 16 16  0  0  0  0 0 0x00--         y  y  y     win
0x62 48  0 16 16 16  0 16  0  0 0 0x00--         y  y  y     win
0x63 48  0 16 16 16  0 24  0  0 0 0x00--         y  y  y     win
0x64 48  0 16 16 16  0 24  8  0 0 0x00--         y  y  y     win
0x65 48  0 16 16 16  0  0  0  2 1 0x00--         y  y  y     win
0x66 48  0 16 16 16  0  0  0  4 1 0x00--         y  y  y     win
0x67 48  0 16 16 16  0  0  0  8 1 0x00--         y  y  y     win
0x68 48  0 16 16 16  0 16  0  2 1 0x00--         y  y  y     win
0x69 48  0 16 16 16  0 16  0  4 1 0x00--         y  y  y     win
0x6a 48  0 16 16 16  0 16  0  8 1 0x00--         y  y  y     win
0x6b 48  0 16 16 16  0 24  0  2 1 0x00--         y  y  y     win
0x6c 48  0 16 16 16  0 24  0  4 1 0x00--         y  y  y     win
0x6d 48  0 16 16 16  0 24  0  8 1 0x00--         y  y  y     win
0x6e 48  0 16 16 16  0 24  8  2 1 0x00--         y  y  y     win
0x6f 48  0 16 16 16  0 24  8  4 1 0x00--         y  y  y     win
0x70 48  0 16 16 16  0 24  8  8 1 0x00--         y  y  y     win

X11 platform:
EGL API version: 1.5
EGL vendor string: Mesa Project
EGL version string: 1.5
EGL client APIs: OpenGL OpenGL_ES 
EGL driver name: radeonsi
EGL extensions string:
    EGL_ANDROID_blob_cache, EGL_ANDROID_native_fence_sync, 
    EGL_ANGLE_sync_control_rate, EGL_CHROMIUM_sync_control, 
    EGL_EXT_buffer_age, EGL_EXT_create_context_robustness, 
    EGL_EXT_image_dma_buf_import, EGL_EXT_image_dma_buf_import_modifiers, 
    EGL_EXT_pixel_format_float, EGL_EXT_swap_buffers_with_damage, 
    EGL_IMG_context_priority, EGL_KHR_cl_event2, EGL_KHR_config_attribs, 
    EGL_KHR_context_flush_control, EGL_KHR_create_context, 
    EGL_KHR_create_context_no_error, EGL_KHR_fence_sync, 
    EGL_KHR_get_all_proc_addresses, EGL_KHR_gl_colorspace, 
    EGL_KHR_gl_renderbuffer_image, EGL_KHR_gl_texture_2D_image, 
    EGL_KHR_gl_texture_3D_image, EGL_KHR_gl_texture_cubemap_image, 
    EGL_KHR_image, EGL_KHR_image_base, EGL_KHR_image_pixmap, 
    EGL_KHR_no_config_context, EGL_KHR_reusable_sync, 
    EGL_KHR_surfaceless_context, EGL_KHR_swap_buffers_with_damage, 
    EGL_KHR_wait_sync, EGL_MESA_configless_context, EGL_MESA_drm_image, 
    EGL_MESA_image_dma_buf_export, EGL_MESA_query_driver, 
    EGL_NOK_texture_from_pixmap, EGL_WL_bind_wayland_display
OpenGL core profile vendor: AMD
OpenGL core profile renderer: AMD Radeon RX 5500 XT (navi14, LLVM 15.0.7, DRM 3.52, 6.3.9-arch1-1)
OpenGL core profile version: 4.6 (Core Profile) Mesa 23.1.3
OpenGL core profile shading language version: 4.60
OpenGL core profile extensions:
    GL_AMD_conservative_depth, GL_AMD_depth_clamp_separate, 
    GL_AMD_draw_buffers_blend, GL_AMD_framebuffer_multisample_advanced, 
    GL_AMD_gpu_shader_int64, GL_AMD_multi_draw_indirect, 
    GL_AMD_performance_monitor, GL_AMD_pinned_memory, 
    GL_AMD_query_buffer_object, GL_AMD_seamless_cubemap_per_texture, 
    GL_AMD_shader_stencil_export, GL_AMD_shader_trinary_minmax, 
    GL_AMD_texture_texture4, GL_AMD_vertex_shader_layer, 
    GL_AMD_vertex_shader_viewport_index, GL_ANGLE_texture_compression_dxt3, 
    GL_ANGLE_texture_compression_dxt5, GL_ARB_ES2_compatibility, 
    GL_ARB_ES3_1_compatibility, GL_ARB_ES3_2_compatibility, 
    GL_ARB_ES3_compatibility, GL_ARB_arrays_of_arrays, GL_ARB_base_instance, 
    GL_ARB_bindless_texture, GL_ARB_blend_func_extended, 
    GL_ARB_buffer_storage, GL_ARB_clear_buffer_object, GL_ARB_clear_texture, 
    GL_ARB_clip_control, GL_ARB_color_buffer_float, 
    GL_ARB_compressed_texture_pixel_storage, GL_ARB_compute_shader, 
    GL_ARB_compute_variable_group_size, GL_ARB_conditional_render_inverted, 
    GL_ARB_conservative_depth, GL_ARB_copy_buffer, GL_ARB_copy_image, 
    GL_ARB_cull_distance, GL_ARB_debug_output, GL_ARB_depth_buffer_float, 
    GL_ARB_depth_clamp, GL_ARB_derivative_control, GL_ARB_direct_state_access, 
    GL_ARB_draw_buffers, GL_ARB_draw_buffers_blend, 
    GL_ARB_draw_elements_base_vertex, GL_ARB_draw_indirect, 
    GL_ARB_draw_instanced, GL_ARB_enhanced_layouts, 
    GL_ARB_explicit_attrib_location, GL_ARB_explicit_uniform_location, 
    GL_ARB_fragment_coord_conventions, GL_ARB_fragment_layer_viewport, 
    GL_ARB_fragment_shader, GL_ARB_framebuffer_no_attachments, 
    GL_ARB_framebuffer_object, GL_ARB_framebuffer_sRGB, 
    GL_ARB_get_program_binary, GL_ARB_get_texture_sub_image, GL_ARB_gl_spirv, 
    GL_ARB_gpu_shader5, GL_ARB_gpu_shader_fp64, GL_ARB_gpu_shader_int64, 
    GL_ARB_half_float_pixel, GL_ARB_half_float_vertex, 
    GL_ARB_indirect_parameters, GL_ARB_instanced_arrays, 
    GL_ARB_internalformat_query, GL_ARB_internalformat_query2, 
    GL_ARB_invalidate_subdata, GL_ARB_map_buffer_alignment, 
    GL_ARB_map_buffer_range, GL_ARB_multi_bind, GL_ARB_multi_draw_indirect, 
    GL_ARB_occlusion_query2, GL_ARB_parallel_shader_compile, 
    GL_ARB_pipeline_statistics_query, GL_ARB_pixel_buffer_object, 
    GL_ARB_point_sprite, GL_ARB_polygon_offset_clamp, 
    GL_ARB_post_depth_coverage, GL_ARB_program_interface_query, 
    GL_ARB_provoking_vertex, GL_ARB_query_buffer_object, 
    GL_ARB_robust_buffer_access_behavior, GL_ARB_robustness, 
    GL_ARB_sample_shading, GL_ARB_sampler_objects, GL_ARB_seamless_cube_map, 
    GL_ARB_seamless_cubemap_per_texture, GL_ARB_separate_shader_objects, 
    GL_ARB_shader_atomic_counter_ops, GL_ARB_shader_atomic_counters, 
    GL_ARB_shader_ballot, GL_ARB_shader_bit_encoding, GL_ARB_shader_clock, 
    GL_ARB_shader_draw_parameters, GL_ARB_shader_group_vote, 
    GL_ARB_shader_image_load_store, GL_ARB_shader_image_size, 
    GL_ARB_shader_objects, GL_ARB_shader_precision, 
    GL_ARB_shader_stencil_export, GL_ARB_shader_storage_buffer_object, 
    GL_ARB_shader_subroutine, GL_ARB_shader_texture_image_samples, 
    GL_ARB_shader_texture_lod, GL_ARB_shader_viewport_layer_array, 
    GL_ARB_shading_language_420pack, GL_ARB_shading_language_include, 
    GL_ARB_shading_language_packing, GL_ARB_sparse_buffer, 
    GL_ARB_sparse_texture, GL_ARB_sparse_texture2, 
    GL_ARB_sparse_texture_clamp, GL_ARB_spirv_extensions, 
    GL_ARB_stencil_texturing, GL_ARB_sync, GL_ARB_tessellation_shader, 
    GL_ARB_texture_barrier, GL_ARB_texture_buffer_object, 
    GL_ARB_texture_buffer_object_rgb32, GL_ARB_texture_buffer_range, 
    GL_ARB_texture_compression_bptc, GL_ARB_texture_compression_rgtc, 
    GL_ARB_texture_cube_map_array, GL_ARB_texture_filter_anisotropic, 
    GL_ARB_texture_float, GL_ARB_texture_gather, 
    GL_ARB_texture_mirror_clamp_to_edge, GL_ARB_texture_multisample, 
    GL_ARB_texture_non_power_of_two, GL_ARB_texture_query_levels, 
    GL_ARB_texture_query_lod, GL_ARB_texture_rectangle, GL_ARB_texture_rg, 
    GL_ARB_texture_rgb10_a2ui, GL_ARB_texture_stencil8, 
    GL_ARB_texture_storage, GL_ARB_texture_storage_multisample, 
    GL_ARB_texture_swizzle, GL_ARB_texture_view, GL_ARB_timer_query, 
    GL_ARB_transform_feedback2, GL_ARB_transform_feedback3, 
    GL_ARB_transform_feedback_instanced, 
    GL_ARB_transform_feedback_overflow_query, GL_ARB_uniform_buffer_object, 
    GL_ARB_vertex_array_bgra, GL_ARB_vertex_array_object, 
    GL_ARB_vertex_attrib_64bit, GL_ARB_vertex_attrib_binding, 
    GL_ARB_vertex_buffer_object, GL_ARB_vertex_shader, 
    GL_ARB_vertex_type_10f_11f_11f_rev, GL_ARB_vertex_type_2_10_10_10_rev, 
    GL_ARB_viewport_array, GL_ATI_blend_equation_separate, GL_ATI_meminfo, 
    GL_ATI_texture_float, GL_ATI_texture_mirror_once, 
    GL_EXT_EGL_image_storage, GL_EXT_EGL_sync, GL_EXT_abgr, 
    GL_EXT_blend_equation_separate, GL_EXT_debug_label, 
    GL_EXT_demote_to_helper_invocation, GL_EXT_depth_bounds_test, 
    GL_EXT_draw_buffers2, GL_EXT_draw_instanced, GL_EXT_framebuffer_blit, 
    GL_EXT_framebuffer_multisample, GL_EXT_framebuffer_multisample_blit_scaled, 
    GL_EXT_framebuffer_object, GL_EXT_framebuffer_sRGB, GL_EXT_memory_object, 
    GL_EXT_memory_object_fd, GL_EXT_packed_depth_stencil, GL_EXT_packed_float, 
    GL_EXT_pixel_buffer_object, GL_EXT_polygon_offset_clamp, 
    GL_EXT_provoking_vertex, GL_EXT_semaphore, GL_EXT_semaphore_fd, 
    GL_EXT_shader_image_load_formatted, GL_EXT_shader_image_load_store, 
    GL_EXT_shader_integer_mix, GL_EXT_shader_samples_identical, 
    GL_EXT_texture_array, GL_EXT_texture_compression_dxt1, 
    GL_EXT_texture_compression_rgtc, GL_EXT_texture_compression_s3tc, 
    GL_EXT_texture_filter_anisotropic, GL_EXT_texture_integer, 
    GL_EXT_texture_mirror_clamp, GL_EXT_texture_sRGB, GL_EXT_texture_sRGB_R8, 
    GL_EXT_texture_sRGB_RG8, GL_EXT_texture_sRGB_decode, 
    GL_EXT_texture_shadow_lod, GL_EXT_texture_shared_exponent, 
    GL_EXT_texture_snorm, GL_EXT_texture_swizzle, GL_EXT_timer_query, 
    GL_EXT_transform_feedback, GL_EXT_vertex_array_bgra, 
    GL_EXT_vertex_attrib_64bit, GL_EXT_window_rectangles, 
    GL_IBM_multimode_draw_arrays, GL_INTEL_blackhole_render, 
    GL_KHR_blend_equation_advanced, GL_KHR_context_flush_control, 
    GL_KHR_debug, GL_KHR_no_error, GL_KHR_parallel_shader_compile, 
    GL_KHR_robust_buffer_access_behavior, GL_KHR_robustness, 
    GL_KHR_texture_compression_astc_ldr, 
    GL_KHR_texture_compression_astc_sliced_3d, GL_MESA_framebuffer_flip_y, 
    GL_MESA_pack_invert, GL_MESA_shader_integer_functions, 
    GL_MESA_texture_signed_rgba, GL_NVX_gpu_memory_info, 
    GL_NV_alpha_to_coverage_dither_control, GL_NV_compute_shader_derivatives, 
    GL_NV_conditional_render, GL_NV_copy_image, GL_NV_depth_clamp, 
    GL_NV_packed_depth_stencil, GL_NV_shader_atomic_int64, 
    GL_NV_texture_barrier, GL_NV_vdpau_interop, GL_OES_EGL_image, GL_S3_s3tc
Memory info (GL_ATI_meminfo):
    VBO free memory - total: 2522 MB, largest block: 2522 MB
    VBO free aux. memory - total: 15856 MB, largest block: 15856 MB
    Texture free memory - total: 2522 MB, largest block: 2522 MB
    Texture free aux. memory - total: 15856 MB, largest block: 15856 MB
    Renderbuffer free memory - total: 2522 MB, largest block: 2522 MB
    Renderbuffer free aux. memory - total: 15856 MB, largest block: 15856 MB
Memory info (GL_NVX_gpu_memory_info):
    Dedicated video memory: 4096 MB
    Total available memory: 20077 MB
    Currently available dedicated video memory: 2522 MB
OpenGL compatibility profile vendor: AMD
OpenGL compatibility profile renderer: AMD Radeon RX 5500 XT (navi14, LLVM 15.0.7, DRM 3.52, 6.3.9-arch1-1)
OpenGL compatibility profile version: 4.6 (Compatibility Profile) Mesa 23.1.3
OpenGL compatibility profile shading language version: 4.60
OpenGL compatibility profile extensions:
    GL_AMD_conservative_depth, GL_AMD_depth_clamp_separate, 
    GL_AMD_draw_buffers_blend, GL_AMD_framebuffer_multisample_advanced, 
    GL_AMD_multi_draw_indirect, GL_AMD_performance_monitor, 
    GL_AMD_pinned_memory, GL_AMD_query_buffer_object, 
    GL_AMD_seamless_cubemap_per_texture, GL_AMD_shader_stencil_export, 
    GL_AMD_shader_trinary_minmax, GL_AMD_texture_texture4, 
    GL_AMD_vertex_shader_layer, GL_AMD_vertex_shader_viewport_index, 
    GL_ANGLE_texture_compression_dxt3, GL_ANGLE_texture_compression_dxt5, 
    GL_APPLE_packed_pixels, GL_ARB_ES2_compatibility, 
    GL_ARB_ES3_1_compatibility, GL_ARB_ES3_2_compatibility, 
    GL_ARB_ES3_compatibility, GL_ARB_arrays_of_arrays, GL_ARB_base_instance, 
    GL_ARB_bindless_texture, GL_ARB_blend_func_extended, 
    GL_ARB_buffer_storage, GL_ARB_clear_buffer_object, GL_ARB_clear_texture, 
    GL_ARB_clip_control, GL_ARB_color_buffer_float, GL_ARB_compatibility, 
    GL_ARB_compressed_texture_pixel_storage, GL_ARB_compute_shader, 
    GL_ARB_compute_variable_group_size, GL_ARB_conditional_render_inverted, 
    GL_ARB_conservative_depth, GL_ARB_copy_buffer, GL_ARB_copy_image, 
    GL_ARB_cull_distance, GL_ARB_debug_output, GL_ARB_depth_buffer_float, 
    GL_ARB_depth_clamp, GL_ARB_depth_texture, GL_ARB_derivative_control, 
    GL_ARB_direct_state_access, GL_ARB_draw_buffers, 
    GL_ARB_draw_buffers_blend, GL_ARB_draw_elements_base_vertex, 
    GL_ARB_draw_indirect, GL_ARB_draw_instanced, GL_ARB_enhanced_layouts, 
    GL_ARB_explicit_attrib_location, GL_ARB_explicit_uniform_location, 
    GL_ARB_fragment_coord_conventions, GL_ARB_fragment_layer_viewport, 
    GL_ARB_fragment_program, GL_ARB_fragment_program_shadow, 
    GL_ARB_fragment_shader, GL_ARB_framebuffer_no_attachments, 
    GL_ARB_framebuffer_object, GL_ARB_framebuffer_sRGB, 
    GL_ARB_get_program_binary, GL_ARB_get_texture_sub_image, GL_ARB_gl_spirv, 
    GL_ARB_gpu_shader5, GL_ARB_gpu_shader_fp64, GL_ARB_gpu_shader_int64, 
    GL_ARB_half_float_pixel, GL_ARB_half_float_vertex, 
    GL_ARB_indirect_parameters, GL_ARB_instanced_arrays, 
    GL_ARB_internalformat_query, GL_ARB_internalformat_query2, 
    GL_ARB_invalidate_subdata, GL_ARB_map_buffer_alignment, 
    GL_ARB_map_buffer_range, GL_ARB_multi_bind, GL_ARB_multi_draw_indirect, 
    GL_ARB_multisample, GL_ARB_multitexture, GL_ARB_occlusion_query, 
    GL_ARB_occlusion_query2, GL_ARB_parallel_shader_compile, 
    GL_ARB_pipeline_statistics_query, GL_ARB_pixel_buffer_object, 
    GL_ARB_point_parameters, GL_ARB_point_sprite, GL_ARB_polygon_offset_clamp, 
    GL_ARB_post_depth_coverage, GL_ARB_program_interface_query, 
    GL_ARB_provoking_vertex, GL_ARB_query_buffer_object, 
    GL_ARB_robust_buffer_access_behavior, GL_ARB_robustness, 
    GL_ARB_sample_shading, GL_ARB_sampler_objects, GL_ARB_seamless_cube_map, 
    GL_ARB_seamless_cubemap_per_texture, GL_ARB_separate_shader_objects, 
    GL_ARB_shader_atomic_counter_ops, GL_ARB_shader_atomic_counters, 
    GL_ARB_shader_ballot, GL_ARB_shader_bit_encoding, GL_ARB_shader_clock, 
    GL_ARB_shader_draw_parameters, GL_ARB_shader_group_vote, 
    GL_ARB_shader_image_load_store, GL_ARB_shader_image_size, 
    GL_ARB_shader_objects, GL_ARB_shader_precision, 
    GL_ARB_shader_stencil_export, GL_ARB_shader_storage_buffer_object, 
    GL_ARB_shader_subroutine, GL_ARB_shader_texture_image_samples, 
    GL_ARB_shader_texture_lod, GL_ARB_shader_viewport_layer_array, 
    GL_ARB_shading_language_100, GL_ARB_shading_language_420pack, 
    GL_ARB_shading_language_include, GL_ARB_shading_language_packing, 
    GL_ARB_shadow, GL_ARB_sparse_buffer, GL_ARB_sparse_texture, 
    GL_ARB_sparse_texture2, GL_ARB_sparse_texture_clamp, 
    GL_ARB_spirv_extensions, GL_ARB_stencil_texturing, GL_ARB_sync, 
    GL_ARB_tessellation_shader, GL_ARB_texture_barrier, 
    GL_ARB_texture_border_clamp, GL_ARB_texture_buffer_object, 
    GL_ARB_texture_buffer_object_rgb32, GL_ARB_texture_buffer_range, 
    GL_ARB_texture_compression, GL_ARB_texture_compression_bptc, 
    GL_ARB_texture_compression_rgtc, GL_ARB_texture_cube_map, 
    GL_ARB_texture_cube_map_array, GL_ARB_texture_env_add, 
    GL_ARB_texture_env_combine, GL_ARB_texture_env_crossbar, 
    GL_ARB_texture_env_dot3, GL_ARB_texture_filter_anisotropic, 
    GL_ARB_texture_float, GL_ARB_texture_gather, 
    GL_ARB_texture_mirror_clamp_to_edge, GL_ARB_texture_mirrored_repeat, 
    GL_ARB_texture_multisample, GL_ARB_texture_non_power_of_two, 
    GL_ARB_texture_query_levels, GL_ARB_texture_query_lod, 
    GL_ARB_texture_rectangle, GL_ARB_texture_rg, GL_ARB_texture_rgb10_a2ui, 
    GL_ARB_texture_stencil8, GL_ARB_texture_storage, 
    GL_ARB_texture_storage_multisample, GL_ARB_texture_swizzle, 
    GL_ARB_texture_view, GL_ARB_timer_query, GL_ARB_transform_feedback2, 
    GL_ARB_transform_feedback3, GL_ARB_transform_feedback_instanced, 
    GL_ARB_transform_feedback_overflow_query, GL_ARB_transpose_matrix, 
    GL_ARB_uniform_buffer_object, GL_ARB_vertex_array_bgra, 
    GL_ARB_vertex_array_object, GL_ARB_vertex_attrib_64bit, 
    GL_ARB_vertex_attrib_binding, GL_ARB_vertex_buffer_object, 
    GL_ARB_vertex_program, GL_ARB_vertex_shader, 
    GL_ARB_vertex_type_10f_11f_11f_rev, GL_ARB_vertex_type_2_10_10_10_rev, 
    GL_ARB_viewport_array, GL_ARB_window_pos, GL_ATI_blend_equation_separate, 
    GL_ATI_draw_buffers, GL_ATI_fragment_shader, GL_ATI_meminfo, 
    GL_ATI_separate_stencil, GL_ATI_texture_compression_3dc, 
    GL_ATI_texture_env_combine3, GL_ATI_texture_float, 
    GL_ATI_texture_mirror_once, GL_EXT_EGL_image_storage, GL_EXT_EGL_sync, 
    GL_EXT_abgr, GL_EXT_bgra, GL_EXT_blend_color, 
    GL_EXT_blend_equation_separate, GL_EXT_blend_func_separate, 
    GL_EXT_blend_minmax, GL_EXT_blend_subtract, GL_EXT_compiled_vertex_array, 
    GL_EXT_copy_texture, GL_EXT_debug_label, 
    GL_EXT_demote_to_helper_invocation, GL_EXT_depth_bounds_test, 
    GL_EXT_direct_state_access, GL_EXT_draw_buffers2, GL_EXT_draw_instanced, 
    GL_EXT_draw_range_elements, GL_EXT_fog_coord, GL_EXT_framebuffer_blit, 
    GL_EXT_framebuffer_multisample, GL_EXT_framebuffer_multisample_blit_scaled, 
    GL_EXT_framebuffer_object, GL_EXT_framebuffer_sRGB, 
    GL_EXT_gpu_program_parameters, GL_EXT_gpu_shader4, GL_EXT_memory_object, 
    GL_EXT_memory_object_fd, GL_EXT_multi_draw_arrays, 
    GL_EXT_packed_depth_stencil, GL_EXT_packed_float, GL_EXT_packed_pixels, 
    GL_EXT_pixel_buffer_object, GL_EXT_point_parameters, 
    GL_EXT_polygon_offset_clamp, GL_EXT_provoking_vertex, 
    GL_EXT_rescale_normal, GL_EXT_secondary_color, GL_EXT_semaphore, 
    GL_EXT_semaphore_fd, GL_EXT_separate_specular_color, 
    GL_EXT_shader_image_load_formatted, GL_EXT_shader_image_load_store, 
    GL_EXT_shader_integer_mix, GL_EXT_shader_samples_identical, 
    GL_EXT_shadow_funcs, GL_EXT_stencil_two_side, GL_EXT_stencil_wrap, 
    GL_EXT_subtexture, GL_EXT_texture, GL_EXT_texture3D, 
    GL_EXT_texture_array, GL_EXT_texture_buffer_object, 
    GL_EXT_texture_compression_dxt1, GL_EXT_texture_compression_latc, 
    GL_EXT_texture_compression_rgtc, GL_EXT_texture_compression_s3tc, 
    GL_EXT_texture_cube_map, GL_EXT_texture_edge_clamp, 
    GL_EXT_texture_env_add, GL_EXT_texture_env_combine, 
    GL_EXT_texture_env_dot3, GL_EXT_texture_filter_anisotropic, 
    GL_EXT_texture_integer, GL_EXT_texture_lod_bias, 
    GL_EXT_texture_mirror_clamp, GL_EXT_texture_object, 
    GL_EXT_texture_rectangle, GL_EXT_texture_sRGB, GL_EXT_texture_sRGB_R8, 
    GL_EXT_texture_sRGB_RG8, GL_EXT_texture_sRGB_decode, 
    GL_EXT_texture_shadow_lod, GL_EXT_texture_shared_exponent, 
    GL_EXT_texture_snorm, GL_EXT_texture_swizzle, GL_EXT_timer_query, 
    GL_EXT_transform_feedback, GL_EXT_vertex_array, GL_EXT_vertex_array_bgra, 
    GL_EXT_vertex_attrib_64bit, GL_EXT_window_rectangles, 
    GL_IBM_multimode_draw_arrays, GL_IBM_rasterpos_clip, 
    GL_IBM_texture_mirrored_repeat, GL_INGR_blend_func_separate, 
    GL_INTEL_blackhole_render, GL_KHR_blend_equation_advanced, 
    GL_KHR_context_flush_control, GL_KHR_debug, GL_KHR_no_error, 
    GL_KHR_parallel_shader_compile, GL_KHR_robust_buffer_access_behavior, 
    GL_KHR_robustness, GL_KHR_texture_compression_astc_ldr, 
    GL_KHR_texture_compression_astc_sliced_3d, GL_MESA_framebuffer_flip_y, 
    GL_MESA_pack_invert, GL_MESA_shader_integer_functions, 
    GL_MESA_texture_signed_rgba, GL_MESA_window_pos, GL_NVX_gpu_memory_info, 
    GL_NV_ES1_1_compatibility, GL_NV_alpha_to_coverage_dither_control, 
    GL_NV_blend_square, GL_NV_compute_shader_derivatives, 
    GL_NV_conditional_render, GL_NV_copy_depth_to_color, GL_NV_copy_image, 
    GL_NV_depth_clamp, GL_NV_fog_distance, GL_NV_half_float, 
    GL_NV_light_max_exponent, GL_NV_packed_depth_stencil, 
    GL_NV_primitive_restart, GL_NV_shader_atomic_int64, 
    GL_NV_texgen_reflection, GL_NV_texture_barrier, 
    GL_NV_texture_env_combine4, GL_NV_texture_rectangle, GL_NV_vdpau_interop, 
    GL_OES_EGL_image, GL_OES_read_format, GL_S3_s3tc, 
    GL_SGIS_generate_mipmap, GL_SGIS_texture_border_clamp, 
    GL_SGIS_texture_edge_clamp, GL_SGIS_texture_lod, GL_SUN_multi_draw_arrays
Memory info (GL_ATI_meminfo):
    VBO free memory - total: 2522 MB, largest block: 2522 MB
    VBO free aux. memory - total: 15856 MB, largest block: 15856 MB
    Texture free memory - total: 2522 MB, largest block: 2522 MB
    Texture free aux. memory - total: 15856 MB, largest block: 15856 MB
    Renderbuffer free memory - total: 2522 MB, largest block: 2522 MB
    Renderbuffer free aux. memory - total: 15856 MB, largest block: 15856 MB
Memory info (GL_NVX_gpu_memory_info):
    Dedicated video memory: 4096 MB
    Total available memory: 20077 MB
    Currently available dedicated video memory: 2522 MB
OpenGL ES profile vendor: AMD
OpenGL ES profile renderer: AMD Radeon RX 5500 XT (navi14, LLVM 15.0.7, DRM 3.52, 6.3.9-arch1-1)
OpenGL ES profile version: OpenGL ES 3.2 Mesa 23.1.3
OpenGL ES profile shading language version: OpenGL ES GLSL ES 3.20
OpenGL ES profile extensions:
    GL_AMD_framebuffer_multisample_advanced, GL_AMD_performance_monitor, 
    GL_ANDROID_extension_pack_es31a, GL_ANGLE_pack_reverse_row_order, 
    GL_ANGLE_texture_compression_dxt3, GL_ANGLE_texture_compression_dxt5, 
    GL_APPLE_texture_max_level, GL_EXT_EGL_image_storage, 
    GL_EXT_base_instance, GL_EXT_blend_func_extended, GL_EXT_blend_minmax, 
    GL_EXT_buffer_storage, GL_EXT_clear_texture, GL_EXT_clip_control, 
    GL_EXT_clip_cull_distance, GL_EXT_color_buffer_float, 
    GL_EXT_color_buffer_half_float, GL_EXT_compressed_ETC1_RGB8_sub_texture, 
    GL_EXT_copy_image, GL_EXT_debug_label, GL_EXT_demote_to_helper_invocation, 
    GL_EXT_depth_clamp, GL_EXT_discard_framebuffer, 
    GL_EXT_disjoint_timer_query, GL_EXT_draw_buffers, 
    GL_EXT_draw_buffers_indexed, GL_EXT_draw_elements_base_vertex, 
    GL_EXT_draw_instanced, GL_EXT_float_blend, GL_EXT_frag_depth, 
    GL_EXT_geometry_point_size, GL_EXT_geometry_shader, GL_EXT_gpu_shader5, 
    GL_EXT_instanced_arrays, GL_EXT_map_buffer_range, GL_EXT_memory_object, 
    GL_EXT_memory_object_fd, GL_EXT_multi_draw_arrays, 
    GL_EXT_occlusion_query_boolean, GL_EXT_polygon_offset_clamp, 
    GL_EXT_primitive_bounding_box, GL_EXT_read_format_bgra, 
    GL_EXT_render_snorm, GL_EXT_robustness, GL_EXT_sRGB_write_control, 
    GL_EXT_semaphore, GL_EXT_semaphore_fd, GL_EXT_separate_shader_objects, 
    GL_EXT_shader_group_vote, GL_EXT_shader_implicit_conversions, 
    GL_EXT_shader_integer_mix, GL_EXT_shader_io_blocks, 
    GL_EXT_shader_samples_identical, GL_EXT_tessellation_point_size, 
    GL_EXT_tessellation_shader, GL_EXT_texture_border_clamp, 
    GL_EXT_texture_buffer, GL_EXT_texture_compression_bptc, 
    GL_EXT_texture_compression_dxt1, GL_EXT_texture_compression_rgtc, 
    GL_EXT_texture_compression_s3tc, GL_EXT_texture_compression_s3tc_srgb, 
    GL_EXT_texture_cube_map_array, GL_EXT_texture_filter_anisotropic, 
    GL_EXT_texture_format_BGRA8888, GL_EXT_texture_mirror_clamp_to_edge, 
    GL_EXT_texture_norm16, GL_EXT_texture_query_lod, GL_EXT_texture_rg, 
    GL_EXT_texture_sRGB_R8, GL_EXT_texture_sRGB_RG8, 
    GL_EXT_texture_sRGB_decode, GL_EXT_texture_shadow_lod, 
    GL_EXT_texture_type_2_10_10_10_REV, GL_EXT_texture_view, 
    GL_EXT_unpack_subimage, GL_EXT_window_rectangles, 
    GL_INTEL_blackhole_render, GL_KHR_blend_equation_advanced, 
    GL_KHR_context_flush_control, GL_KHR_debug, GL_KHR_no_error, 
    GL_KHR_parallel_shader_compile, GL_KHR_robust_buffer_access_behavior, 
    GL_KHR_robustness, GL_KHR_texture_compression_astc_ldr, 
    GL_KHR_texture_compression_astc_sliced_3d, GL_MESA_bgra, 
    GL_MESA_framebuffer_flip_y, GL_MESA_shader_integer_functions, 
    GL_NV_alpha_to_coverage_dither_control, GL_NV_compute_shader_derivatives, 
    GL_NV_conditional_render, GL_NV_draw_buffers, GL_NV_fbo_color_attachments, 
    GL_NV_generate_mipmap_sRGB, GL_NV_image_formats, GL_NV_pack_subimage, 
    GL_NV_pixel_buffer_object, GL_NV_read_buffer, GL_NV_read_depth, 
    GL_NV_read_depth_stencil, GL_NV_read_stencil, 
    GL_NV_shader_noperspective_interpolation, GL_OES_EGL_image, 
    GL_OES_EGL_image_external, GL_OES_EGL_image_external_essl3, 
    GL_OES_EGL_sync, GL_OES_compressed_ETC1_RGB8_texture, GL_OES_copy_image, 
    GL_OES_depth24, GL_OES_depth_texture, GL_OES_depth_texture_cube_map, 
    GL_OES_draw_buffers_indexed, GL_OES_draw_elements_base_vertex, 
    GL_OES_element_index_uint, GL_OES_fbo_render_mipmap, 
    GL_OES_geometry_point_size, GL_OES_geometry_shader, 
    GL_OES_get_program_binary, GL_OES_gpu_shader5, GL_OES_mapbuffer, 
    GL_OES_packed_depth_stencil, GL_OES_primitive_bounding_box, 
    GL_OES_required_internalformat, GL_OES_rgb8_rgba8, GL_OES_sample_shading, 
    GL_OES_sample_variables, GL_OES_shader_image_atomic, 
    GL_OES_shader_io_blocks, GL_OES_shader_multisample_interpolation, 
    GL_OES_standard_derivatives, GL_OES_stencil8, GL_OES_surfaceless_context, 
    GL_OES_tessellation_point_size, GL_OES_tessellation_shader, 
    GL_OES_texture_3D, GL_OES_texture_border_clamp, GL_OES_texture_buffer, 
    GL_OES_texture_cube_map_array, GL_OES_texture_float, 
    GL_OES_texture_float_linear, GL_OES_texture_half_float, 
    GL_OES_texture_half_float_linear, GL_OES_texture_npot, 
    GL_OES_texture_stencil8, GL_OES_texture_storage_multisample_2d_array, 
    GL_OES_texture_view, GL_OES_vertex_array_object, GL_OES_vertex_half_float, 
    GL_OES_viewport_array
Configurations:
     bf lv colorbuffer dp st  ms    vis   cav bi  renderable  supported
  id sz  l  r  g  b  a th cl ns b    id   eat nd gl es es2 vg surfaces 
---------------------------------------------------------------------
0x01 32  0  8  8  8  8  0  0  0 0 0x4aTC      a  y  y  y     win,pb,pix
0x02 32  0  8  8  8  8 16  0  0 0 0x4aTC      a  y  y  y     win,pb,pix
0x03 32  0  8  8  8  8 24  0  0 0 0x4aTC      a  y  y  y     win,pb,pix
0x04 32  0  8  8  8  8 24  8  0 0 0x4aTC      a  y  y  y     win,pb,pix
0x05 32  0  8  8  8  8  0  0  2 1 0x4aTC      a  y  y  y     win,pb,pix
0x06 32  0  8  8  8  8  0  0  4 1 0x4aTC      a  y  y  y     win,pb,pix
0x07 32  0  8  8  8  8  0  0  8 1 0x4aTC      a  y  y  y     win,pb,pix
0x08 32  0  8  8  8  8 16  0  2 1 0x4aTC      a  y  y  y     win,pb,pix
0x09 32  0  8  8  8  8 16  0  4 1 0x4aTC      a  y  y  y     win,pb,pix
0x0a 32  0  8  8  8  8 16  0  8 1 0x4aTC      a  y  y  y     win,pb,pix
0x0b 32  0  8  8  8  8 24  0  2 1 0x4aTC      a  y  y  y     win,pb,pix
0x0c 32  0  8  8  8  8 24  0  4 1 0x4aTC      a  y  y  y     win,pb,pix
0x0d 32  0  8  8  8  8 24  0  8 1 0x4aTC      a  y  y  y     win,pb,pix
0x0e 32  0  8  8  8  8 24  8  2 1 0x4aTC      a  y  y  y     win,pb,pix
0x0f 32  0  8  8  8  8 24  8  4 1 0x4aTC      a  y  y  y     win,pb,pix
0x10 32  0  8  8  8  8 24  8  8 1 0x4aTC      a  y  y  y     win,pb,pix
0x11 24  0  8  8  8  0  0  0  0 0 0x4aTC      y  y  y  y     win,pb,pix
0x12 24  0  8  8  8  0 16  0  0 0 0x4aTC      y  y  y  y     win,pb,pix
0x13 24  0  8  8  8  0 24  0  0 0 0x4aTC      y  y  y  y     win,pb,pix
0x14 24  0  8  8  8  0 24  8  0 0 0x4aTC      y  y  y  y     win,pb,pix
0x15 24  0  8  8  8  0  0  0  2 1 0x4aTC      y  y  y  y     win,pb,pix
0x16 24  0  8  8  8  0  0  0  4 1 0x4aTC      y  y  y  y     win,pb,pix
0x17 24  0  8  8  8  0  0  0  8 1 0x4aTC      y  y  y  y     win,pb,pix
0x18 24  0  8  8  8  0 16  0  2 1 0x4aTC      y  y  y  y     win,pb,pix
0x19 24  0  8  8  8  0 16  0  4 1 0x4aTC      y  y  y  y     win,pb,pix
0x1a 24  0  8  8  8  0 16  0  8 1 0x4aTC      y  y  y  y     win,pb,pix
0x1b 24  0  8  8  8  0 24  0  2 1 0x4aTC      y  y  y  y     win,pb,pix
0x1c 24  0  8  8  8  0 24  0  4 1 0x4aTC      y  y  y  y     win,pb,pix
0x1d 24  0  8  8  8  0 24  0  8 1 0x4aTC      y  y  y  y     win,pb,pix
0x1e 24  0  8  8  8  0 24  8  2 1 0x4aTC      y  y  y  y     win,pb,pix
0x1f 24  0  8  8  8  0 24  8  4 1 0x4aTC      y  y  y  y     win,pb,pix
0x20 24  0  8  8  8  0 24  8  8 1 0x4aTC      y  y  y  y     win,pb,pix
0x21 32  0  8  8  8  8  0  0  0 0 0x4bDC      a  y  y  y     win,pb,pix
0x22 32  0  8  8  8  8 16  0  0 0 0x4bDC      a  y  y  y     win,pb,pix
0x23 32  0  8  8  8  8 24  0  0 0 0x4bDC      a  y  y  y     win,pb,pix
0x24 32  0  8  8  8  8 24  8  0 0 0x4bDC      a  y  y  y     win,pb,pix
0x25 32  0  8  8  8  8  0  0  2 1 0x4bDC      a  y  y  y     win,pb,pix
0x26 32  0  8  8  8  8  0  0  4 1 0x4bDC      a  y  y  y     win,pb,pix
0x27 32  0  8  8  8  8  0  0  8 1 0x4bDC      a  y  y  y     win,pb,pix
0x28 32  0  8  8  8  8 16  0  2 1 0x4bDC      a  y  y  y     win,pb,pix
0x29 32  0  8  8  8  8 16  0  4 1 0x4bDC      a  y  y  y     win,pb,pix
0x2a 32  0  8  8  8  8 16  0  8 1 0x4bDC      a  y  y  y     win,pb,pix
0x2b 32  0  8  8  8  8 24  0  2 1 0x4bDC      a  y  y  y     win,pb,pix
0x2c 32  0  8  8  8  8 24  0  4 1 0x4bDC      a  y  y  y     win,pb,pix
0x2d 32  0  8  8  8  8 24  0  8 1 0x4bDC      a  y  y  y     win,pb,pix
0x2e 32  0  8  8  8  8 24  8  2 1 0x4bDC      a  y  y  y     win,pb,pix
0x2f 32  0  8  8  8  8 24  8  4 1 0x4bDC      a  y  y  y     win,pb,pix
0x30 32  0  8  8  8  8 24  8  8 1 0x4bDC      a  y  y  y     win,pb,pix
0x31 24  0  8  8  8  0  0  0  0 0 0x4bDC      y  y  y  y     win,pb,pix
0x32 24  0  8  8  8  0 16  0  0 0 0x4bDC      y  y  y  y     win,pb,pix
0x33 24  0  8  8  8  0 24  0  0 0 0x4bDC      y  y  y  y     win,pb,pix
0x34 24  0  8  8  8  0 24  8  0 0 0x4bDC      y  y  y  y     win,pb,pix
0x35 24  0  8  8  8  0  0  0  2 1 0x4bDC      y  y  y  y     win,pb,pix
0x36 24  0  8  8  8  0  0  0  4 1 0x4bDC      y  y  y  y     win,pb,pix
0x37 24  0  8  8  8  0  0  0  8 1 0x4bDC      y  y  y  y     win,pb,pix
0x38 24  0  8  8  8  0 16  0  2 1 0x4bDC      y  y  y  y     win,pb,pix
0x39 24  0  8  8  8  0 16  0  4 1 0x4bDC      y  y  y  y     win,pb,pix
0x3a 24  0  8  8  8  0 16  0  8 1 0x4bDC      y  y  y  y     win,pb,pix
0x3b 24  0  8  8  8  0 24  0  2 1 0x4bDC      y  y  y  y     win,pb,pix
0x3c 24  0  8  8  8  0 24  0  4 1 0x4bDC      y  y  y  y     win,pb,pix
0x3d 24  0  8  8  8  0 24  0  8 1 0x4bDC      y  y  y  y     win,pb,pix
0x3e 24  0  8  8  8  0 24  8  2 1 0x4bDC      y  y  y  y     win,pb,pix
0x3f 24  0  8  8  8  0 24  8  4 1 0x4bDC      y  y  y  y     win,pb,pix
0x40 24  0  8  8  8  0 24  8  8 1 0x4bDC      y  y  y  y     win,pb,pix

Surfaceless platform:
EGL API version: 1.5
EGL vendor string: Mesa Project
EGL version string: 1.5
EGL client APIs: OpenGL OpenGL_ES 
EGL driver name: radeonsi
EGL extensions string:
    EGL_ANDROID_blob_cache, EGL_ANDROID_native_fence_sync, 
    EGL_EXT_create_context_robustness, EGL_EXT_image_dma_buf_import, 
    EGL_EXT_image_dma_buf_import_modifiers, EGL_EXT_pixel_format_float, 
    EGL_IMG_context_priority, EGL_KHR_cl_event2, EGL_KHR_config_attribs, 
    EGL_KHR_context_flush_control, EGL_KHR_create_context, 
    EGL_KHR_create_context_no_error, EGL_KHR_fence_sync, 
    EGL_KHR_get_all_proc_addresses, EGL_KHR_gl_colorspace, 
    EGL_KHR_gl_renderbuffer_image, EGL_KHR_gl_texture_2D_image, 
    EGL_KHR_gl_texture_3D_image, EGL_KHR_gl_texture_cubemap_image, 
    EGL_KHR_image_base, EGL_KHR_no_config_context, EGL_KHR_reusable_sync, 
    EGL_KHR_surfaceless_context, EGL_KHR_wait_sync, 
    EGL_MESA_configless_context, EGL_MESA_drm_image, 
    EGL_MESA_image_dma_buf_export, EGL_MESA_query_driver, 
    EGL_WL_bind_wayland_display
OpenGL core profile vendor: AMD
OpenGL core profile renderer: AMD Radeon RX 5500 XT (navi14, LLVM 15.0.7, DRM 3.52, 6.3.9-arch1-1)
OpenGL core profile version: 4.6 (Core Profile) Mesa 23.1.3
OpenGL core profile shading language version: 4.60
OpenGL core profile extensions:
    GL_AMD_conservative_depth, GL_AMD_depth_clamp_separate, 
    GL_AMD_draw_buffers_blend, GL_AMD_framebuffer_multisample_advanced, 
    GL_AMD_gpu_shader_int64, GL_AMD_multi_draw_indirect, 
    GL_AMD_performance_monitor, GL_AMD_pinned_memory, 
    GL_AMD_query_buffer_object, GL_AMD_seamless_cubemap_per_texture, 
    GL_AMD_shader_stencil_export, GL_AMD_shader_trinary_minmax, 
    GL_AMD_texture_texture4, GL_AMD_vertex_shader_layer, 
    GL_AMD_vertex_shader_viewport_index, GL_ANGLE_texture_compression_dxt3, 
    GL_ANGLE_texture_compression_dxt5, GL_ARB_ES2_compatibility, 
    GL_ARB_ES3_1_compatibility, GL_ARB_ES3_2_compatibility, 
    GL_ARB_ES3_compatibility, GL_ARB_arrays_of_arrays, GL_ARB_base_instance, 
    GL_ARB_bindless_texture, GL_ARB_blend_func_extended, 
    GL_ARB_buffer_storage, GL_ARB_clear_buffer_object, GL_ARB_clear_texture, 
    GL_ARB_clip_control, GL_ARB_color_buffer_float, 
    GL_ARB_compressed_texture_pixel_storage, GL_ARB_compute_shader, 
    GL_ARB_compute_variable_group_size, GL_ARB_conditional_render_inverted, 
    GL_ARB_conservative_depth, GL_ARB_copy_buffer, GL_ARB_copy_image, 
    GL_ARB_cull_distance, GL_ARB_debug_output, GL_ARB_depth_buffer_float, 
    GL_ARB_depth_clamp, GL_ARB_derivative_control, GL_ARB_direct_state_access, 
    GL_ARB_draw_buffers, GL_ARB_draw_buffers_blend, 
    GL_ARB_draw_elements_base_vertex, GL_ARB_draw_indirect, 
    GL_ARB_draw_instanced, GL_ARB_enhanced_layouts, 
    GL_ARB_explicit_attrib_location, GL_ARB_explicit_uniform_location, 
    GL_ARB_fragment_coord_conventions, GL_ARB_fragment_layer_viewport, 
    GL_ARB_fragment_shader, GL_ARB_framebuffer_no_attachments, 
    GL_ARB_framebuffer_object, GL_ARB_framebuffer_sRGB, 
    GL_ARB_get_program_binary, GL_ARB_get_texture_sub_image, GL_ARB_gl_spirv, 
    GL_ARB_gpu_shader5, GL_ARB_gpu_shader_fp64, GL_ARB_gpu_shader_int64, 
    GL_ARB_half_float_pixel, GL_ARB_half_float_vertex, 
    GL_ARB_indirect_parameters, GL_ARB_instanced_arrays, 
    GL_ARB_internalformat_query, GL_ARB_internalformat_query2, 
    GL_ARB_invalidate_subdata, GL_ARB_map_buffer_alignment, 
    GL_ARB_map_buffer_range, GL_ARB_multi_bind, GL_ARB_multi_draw_indirect, 
    GL_ARB_occlusion_query2, GL_ARB_parallel_shader_compile, 
    GL_ARB_pipeline_statistics_query, GL_ARB_pixel_buffer_object, 
    GL_ARB_point_sprite, GL_ARB_polygon_offset_clamp, 
    GL_ARB_post_depth_coverage, GL_ARB_program_interface_query, 
    GL_ARB_provoking_vertex, GL_ARB_query_buffer_object, 
    GL_ARB_robust_buffer_access_behavior, GL_ARB_robustness, 
    GL_ARB_sample_shading, GL_ARB_sampler_objects, GL_ARB_seamless_cube_map, 
    GL_ARB_seamless_cubemap_per_texture, GL_ARB_separate_shader_objects, 
    GL_ARB_shader_atomic_counter_ops, GL_ARB_shader_atomic_counters, 
    GL_ARB_shader_ballot, GL_ARB_shader_bit_encoding, GL_ARB_shader_clock, 
    GL_ARB_shader_draw_parameters, GL_ARB_shader_group_vote, 
    GL_ARB_shader_image_load_store, GL_ARB_shader_image_size, 
    GL_ARB_shader_objects, GL_ARB_shader_precision, 
    GL_ARB_shader_stencil_export, GL_ARB_shader_storage_buffer_object, 
    GL_ARB_shader_subroutine, GL_ARB_shader_texture_image_samples, 
    GL_ARB_shader_texture_lod, GL_ARB_shader_viewport_layer_array, 
    GL_ARB_shading_language_420pack, GL_ARB_shading_language_include, 
    GL_ARB_shading_language_packing, GL_ARB_sparse_buffer, 
    GL_ARB_sparse_texture, GL_ARB_sparse_texture2, 
    GL_ARB_sparse_texture_clamp, GL_ARB_spirv_extensions, 
    GL_ARB_stencil_texturing, GL_ARB_sync, GL_ARB_tessellation_shader, 
    GL_ARB_texture_barrier, GL_ARB_texture_buffer_object, 
    GL_ARB_texture_buffer_object_rgb32, GL_ARB_texture_buffer_range, 
    GL_ARB_texture_compression_bptc, GL_ARB_texture_compression_rgtc, 
    GL_ARB_texture_cube_map_array, GL_ARB_texture_filter_anisotropic, 
    GL_ARB_texture_float, GL_ARB_texture_gather, 
    GL_ARB_texture_mirror_clamp_to_edge, GL_ARB_texture_multisample, 
    GL_ARB_texture_non_power_of_two, GL_ARB_texture_query_levels, 
    GL_ARB_texture_query_lod, GL_ARB_texture_rectangle, GL_ARB_texture_rg, 
    GL_ARB_texture_rgb10_a2ui, GL_ARB_texture_stencil8, 
    GL_ARB_texture_storage, GL_ARB_texture_storage_multisample, 
    GL_ARB_texture_swizzle, GL_ARB_texture_view, GL_ARB_timer_query, 
    GL_ARB_transform_feedback2, GL_ARB_transform_feedback3, 
    GL_ARB_transform_feedback_instanced, 
    GL_ARB_transform_feedback_overflow_query, GL_ARB_uniform_buffer_object, 
    GL_ARB_vertex_array_bgra, GL_ARB_vertex_array_object, 
    GL_ARB_vertex_attrib_64bit, GL_ARB_vertex_attrib_binding, 
    GL_ARB_vertex_buffer_object, GL_ARB_vertex_shader, 
    GL_ARB_vertex_type_10f_11f_11f_rev, GL_ARB_vertex_type_2_10_10_10_rev, 
    GL_ARB_viewport_array, GL_ATI_blend_equation_separate, GL_ATI_meminfo, 
    GL_ATI_texture_float, GL_ATI_texture_mirror_once, 
    GL_EXT_EGL_image_storage, GL_EXT_EGL_sync, GL_EXT_abgr, 
    GL_EXT_blend_equation_separate, GL_EXT_debug_label, 
    GL_EXT_demote_to_helper_invocation, GL_EXT_depth_bounds_test, 
    GL_EXT_draw_buffers2, GL_EXT_draw_instanced, GL_EXT_framebuffer_blit, 
    GL_EXT_framebuffer_multisample, GL_EXT_framebuffer_multisample_blit_scaled, 
    GL_EXT_framebuffer_object, GL_EXT_framebuffer_sRGB, GL_EXT_memory_object, 
    GL_EXT_memory_object_fd, GL_EXT_packed_depth_stencil, GL_EXT_packed_float, 
    GL_EXT_pixel_buffer_object, GL_EXT_polygon_offset_clamp, 
    GL_EXT_provoking_vertex, GL_EXT_semaphore, GL_EXT_semaphore_fd, 
    GL_EXT_shader_image_load_formatted, GL_EXT_shader_image_load_store, 
    GL_EXT_shader_integer_mix, GL_EXT_shader_samples_identical, 
    GL_EXT_texture_array, GL_EXT_texture_compression_dxt1, 
    GL_EXT_texture_compression_rgtc, GL_EXT_texture_compression_s3tc, 
    GL_EXT_texture_filter_anisotropic, GL_EXT_texture_integer, 
    GL_EXT_texture_mirror_clamp, GL_EXT_texture_sRGB, GL_EXT_texture_sRGB_R8, 
    GL_EXT_texture_sRGB_RG8, GL_EXT_texture_sRGB_decode, 
    GL_EXT_texture_shadow_lod, GL_EXT_texture_shared_exponent, 
    GL_EXT_texture_snorm, GL_EXT_texture_swizzle, GL_EXT_timer_query, 
    GL_EXT_transform_feedback, GL_EXT_vertex_array_bgra, 
    GL_EXT_vertex_attrib_64bit, GL_EXT_window_rectangles, 
    GL_IBM_multimode_draw_arrays, GL_INTEL_blackhole_render, 
    GL_KHR_blend_equation_advanced, GL_KHR_context_flush_control, 
    GL_KHR_debug, GL_KHR_no_error, GL_KHR_parallel_shader_compile, 
    GL_KHR_robust_buffer_access_behavior, GL_KHR_robustness, 
    GL_KHR_texture_compression_astc_ldr, 
    GL_KHR_texture_compression_astc_sliced_3d, GL_MESA_framebuffer_flip_y, 
    GL_MESA_pack_invert, GL_MESA_shader_integer_functions, 
    GL_MESA_texture_signed_rgba, GL_NVX_gpu_memory_info, 
    GL_NV_alpha_to_coverage_dither_control, GL_NV_compute_shader_derivatives, 
    GL_NV_conditional_render, GL_NV_copy_image, GL_NV_depth_clamp, 
    GL_NV_packed_depth_stencil, GL_NV_shader_atomic_int64, 
    GL_NV_texture_barrier, GL_NV_vdpau_interop, GL_OES_EGL_image, GL_S3_s3tc
Memory info (GL_ATI_meminfo):
    VBO free memory - total: 2522 MB, largest block: 2522 MB
    VBO free aux. memory - total: 15856 MB, largest block: 15856 MB
    Texture free memory - total: 2522 MB, largest block: 2522 MB
    Texture free aux. memory - total: 15856 MB, largest block: 15856 MB
    Renderbuffer free memory - total: 2522 MB, largest block: 2522 MB
    Renderbuffer free aux. memory - total: 15856 MB, largest block: 15856 MB
Memory info (GL_NVX_gpu_memory_info):
    Dedicated video memory: 4096 MB
    Total available memory: 20077 MB
    Currently available dedicated video memory: 2522 MB
OpenGL compatibility profile vendor: AMD
OpenGL compatibility profile renderer: AMD Radeon RX 5500 XT (navi14, LLVM 15.0.7, DRM 3.52, 6.3.9-arch1-1)
OpenGL compatibility profile version: 4.6 (Compatibility Profile) Mesa 23.1.3
OpenGL compatibility profile shading language version: 4.60
OpenGL compatibility profile extensions:
    GL_AMD_conservative_depth, GL_AMD_depth_clamp_separate, 
    GL_AMD_draw_buffers_blend, GL_AMD_framebuffer_multisample_advanced, 
    GL_AMD_multi_draw_indirect, GL_AMD_performance_monitor, 
    GL_AMD_pinned_memory, GL_AMD_query_buffer_object, 
    GL_AMD_seamless_cubemap_per_texture, GL_AMD_shader_stencil_export, 
    GL_AMD_shader_trinary_minmax, GL_AMD_texture_texture4, 
    GL_AMD_vertex_shader_layer, GL_AMD_vertex_shader_viewport_index, 
    GL_ANGLE_texture_compression_dxt3, GL_ANGLE_texture_compression_dxt5, 
    GL_APPLE_packed_pixels, GL_ARB_ES2_compatibility, 
    GL_ARB_ES3_1_compatibility, GL_ARB_ES3_2_compatibility, 
    GL_ARB_ES3_compatibility, GL_ARB_arrays_of_arrays, GL_ARB_base_instance, 
    GL_ARB_bindless_texture, GL_ARB_blend_func_extended, 
    GL_ARB_buffer_storage, GL_ARB_clear_buffer_object, GL_ARB_clear_texture, 
    GL_ARB_clip_control, GL_ARB_color_buffer_float, GL_ARB_compatibility, 
    GL_ARB_compressed_texture_pixel_storage, GL_ARB_compute_shader, 
    GL_ARB_compute_variable_group_size, GL_ARB_conditional_render_inverted, 
    GL_ARB_conservative_depth, GL_ARB_copy_buffer, GL_ARB_copy_image, 
    GL_ARB_cull_distance, GL_ARB_debug_output, GL_ARB_depth_buffer_float, 
    GL_ARB_depth_clamp, GL_ARB_depth_texture, GL_ARB_derivative_control, 
    GL_ARB_direct_state_access, GL_ARB_draw_buffers, 
    GL_ARB_draw_buffers_blend, GL_ARB_draw_elements_base_vertex, 
    GL_ARB_draw_indirect, GL_ARB_draw_instanced, GL_ARB_enhanced_layouts, 
    GL_ARB_explicit_attrib_location, GL_ARB_explicit_uniform_location, 
    GL_ARB_fragment_coord_conventions, GL_ARB_fragment_layer_viewport, 
    GL_ARB_fragment_program, GL_ARB_fragment_program_shadow, 
    GL_ARB_fragment_shader, GL_ARB_framebuffer_no_attachments, 
    GL_ARB_framebuffer_object, GL_ARB_framebuffer_sRGB, 
    GL_ARB_get_program_binary, GL_ARB_get_texture_sub_image, GL_ARB_gl_spirv, 
    GL_ARB_gpu_shader5, GL_ARB_gpu_shader_fp64, GL_ARB_gpu_shader_int64, 
    GL_ARB_half_float_pixel, GL_ARB_half_float_vertex, 
    GL_ARB_indirect_parameters, GL_ARB_instanced_arrays, 
    GL_ARB_internalformat_query, GL_ARB_internalformat_query2, 
    GL_ARB_invalidate_subdata, GL_ARB_map_buffer_alignment, 
    GL_ARB_map_buffer_range, GL_ARB_multi_bind, GL_ARB_multi_draw_indirect, 
    GL_ARB_multisample, GL_ARB_multitexture, GL_ARB_occlusion_query, 
    GL_ARB_occlusion_query2, GL_ARB_parallel_shader_compile, 
    GL_ARB_pipeline_statistics_query, GL_ARB_pixel_buffer_object, 
    GL_ARB_point_parameters, GL_ARB_point_sprite, GL_ARB_polygon_offset_clamp, 
    GL_ARB_post_depth_coverage, GL_ARB_program_interface_query, 
    GL_ARB_provoking_vertex, GL_ARB_query_buffer_object, 
    GL_ARB_robust_buffer_access_behavior, GL_ARB_robustness, 
    GL_ARB_sample_shading, GL_ARB_sampler_objects, GL_ARB_seamless_cube_map, 
    GL_ARB_seamless_cubemap_per_texture, GL_ARB_separate_shader_objects, 
    GL_ARB_shader_atomic_counter_ops, GL_ARB_shader_atomic_counters, 
    GL_ARB_shader_ballot, GL_ARB_shader_bit_encoding, GL_ARB_shader_clock, 
    GL_ARB_shader_draw_parameters, GL_ARB_shader_group_vote, 
    GL_ARB_shader_image_load_store, GL_ARB_shader_image_size, 
    GL_ARB_shader_objects, GL_ARB_shader_precision, 
    GL_ARB_shader_stencil_export, GL_ARB_shader_storage_buffer_object, 
    GL_ARB_shader_subroutine, GL_ARB_shader_texture_image_samples, 
    GL_ARB_shader_texture_lod, GL_ARB_shader_viewport_layer_array, 
    GL_ARB_shading_language_100, GL_ARB_shading_language_420pack, 
    GL_ARB_shading_language_include, GL_ARB_shading_language_packing, 
    GL_ARB_shadow, GL_ARB_sparse_buffer, GL_ARB_sparse_texture, 
    GL_ARB_sparse_texture2, GL_ARB_sparse_texture_clamp, 
    GL_ARB_spirv_extensions, GL_ARB_stencil_texturing, GL_ARB_sync, 
    GL_ARB_tessellation_shader, GL_ARB_texture_barrier, 
    GL_ARB_texture_border_clamp, GL_ARB_texture_buffer_object, 
    GL_ARB_texture_buffer_object_rgb32, GL_ARB_texture_buffer_range, 
    GL_ARB_texture_compression, GL_ARB_texture_compression_bptc, 
    GL_ARB_texture_compression_rgtc, GL_ARB_texture_cube_map, 
    GL_ARB_texture_cube_map_array, GL_ARB_texture_env_add, 
    GL_ARB_texture_env_combine, GL_ARB_texture_env_crossbar, 
    GL_ARB_texture_env_dot3, GL_ARB_texture_filter_anisotropic, 
    GL_ARB_texture_float, GL_ARB_texture_gather, 
    GL_ARB_texture_mirror_clamp_to_edge, GL_ARB_texture_mirrored_repeat, 
    GL_ARB_texture_multisample, GL_ARB_texture_non_power_of_two, 
    GL_ARB_texture_query_levels, GL_ARB_texture_query_lod, 
    GL_ARB_texture_rectangle, GL_ARB_texture_rg, GL_ARB_texture_rgb10_a2ui, 
    GL_ARB_texture_stencil8, GL_ARB_texture_storage, 
    GL_ARB_texture_storage_multisample, GL_ARB_texture_swizzle, 
    GL_ARB_texture_view, GL_ARB_timer_query, GL_ARB_transform_feedback2, 
    GL_ARB_transform_feedback3, GL_ARB_transform_feedback_instanced, 
    GL_ARB_transform_feedback_overflow_query, GL_ARB_transpose_matrix, 
    GL_ARB_uniform_buffer_object, GL_ARB_vertex_array_bgra, 
    GL_ARB_vertex_array_object, GL_ARB_vertex_attrib_64bit, 
    GL_ARB_vertex_attrib_binding, GL_ARB_vertex_buffer_object, 
    GL_ARB_vertex_program, GL_ARB_vertex_shader, 
    GL_ARB_vertex_type_10f_11f_11f_rev, GL_ARB_vertex_type_2_10_10_10_rev, 
    GL_ARB_viewport_array, GL_ARB_window_pos, GL_ATI_blend_equation_separate, 
    GL_ATI_draw_buffers, GL_ATI_fragment_shader, GL_ATI_meminfo, 
    GL_ATI_separate_stencil, GL_ATI_texture_compression_3dc, 
    GL_ATI_texture_env_combine3, GL_ATI_texture_float, 
    GL_ATI_texture_mirror_once, GL_EXT_EGL_image_storage, GL_EXT_EGL_sync, 
    GL_EXT_abgr, GL_EXT_bgra, GL_EXT_blend_color, 
    GL_EXT_blend_equation_separate, GL_EXT_blend_func_separate, 
    GL_EXT_blend_minmax, GL_EXT_blend_subtract, GL_EXT_compiled_vertex_array, 
    GL_EXT_copy_texture, GL_EXT_debug_label, 
    GL_EXT_demote_to_helper_invocation, GL_EXT_depth_bounds_test, 
    GL_EXT_direct_state_access, GL_EXT_draw_buffers2, GL_EXT_draw_instanced, 
    GL_EXT_draw_range_elements, GL_EXT_fog_coord, GL_EXT_framebuffer_blit, 
    GL_EXT_framebuffer_multisample, GL_EXT_framebuffer_multisample_blit_scaled, 
    GL_EXT_framebuffer_object, GL_EXT_framebuffer_sRGB, 
    GL_EXT_gpu_program_parameters, GL_EXT_gpu_shader4, GL_EXT_memory_object, 
    GL_EXT_memory_object_fd, GL_EXT_multi_draw_arrays, 
    GL_EXT_packed_depth_stencil, GL_EXT_packed_float, GL_EXT_packed_pixels, 
    GL_EXT_pixel_buffer_object, GL_EXT_point_parameters, 
    GL_EXT_polygon_offset_clamp, GL_EXT_provoking_vertex, 
    GL_EXT_rescale_normal, GL_EXT_secondary_color, GL_EXT_semaphore, 
    GL_EXT_semaphore_fd, GL_EXT_separate_specular_color, 
    GL_EXT_shader_image_load_formatted, GL_EXT_shader_image_load_store, 
    GL_EXT_shader_integer_mix, GL_EXT_shader_samples_identical, 
    GL_EXT_shadow_funcs, GL_EXT_stencil_two_side, GL_EXT_stencil_wrap, 
    GL_EXT_subtexture, GL_EXT_texture, GL_EXT_texture3D, 
    GL_EXT_texture_array, GL_EXT_texture_buffer_object, 
    GL_EXT_texture_compression_dxt1, GL_EXT_texture_compression_latc, 
    GL_EXT_texture_compression_rgtc, GL_EXT_texture_compression_s3tc, 
    GL_EXT_texture_cube_map, GL_EXT_texture_edge_clamp, 
    GL_EXT_texture_env_add, GL_EXT_texture_env_combine, 
    GL_EXT_texture_env_dot3, GL_EXT_texture_filter_anisotropic, 
    GL_EXT_texture_integer, GL_EXT_texture_lod_bias, 
    GL_EXT_texture_mirror_clamp, GL_EXT_texture_object, 
    GL_EXT_texture_rectangle, GL_EXT_texture_sRGB, GL_EXT_texture_sRGB_R8, 
    GL_EXT_texture_sRGB_RG8, GL_EXT_texture_sRGB_decode, 
    GL_EXT_texture_shadow_lod, GL_EXT_texture_shared_exponent, 
    GL_EXT_texture_snorm, GL_EXT_texture_swizzle, GL_EXT_timer_query, 
    GL_EXT_transform_feedback, GL_EXT_vertex_array, GL_EXT_vertex_array_bgra, 
    GL_EXT_vertex_attrib_64bit, GL_EXT_window_rectangles, 
    GL_IBM_multimode_draw_arrays, GL_IBM_rasterpos_clip, 
    GL_IBM_texture_mirrored_repeat, GL_INGR_blend_func_separate, 
    GL_INTEL_blackhole_render, GL_KHR_blend_equation_advanced, 
    GL_KHR_context_flush_control, GL_KHR_debug, GL_KHR_no_error, 
    GL_KHR_parallel_shader_compile, GL_KHR_robust_buffer_access_behavior, 
    GL_KHR_robustness, GL_KHR_texture_compression_astc_ldr, 
    GL_KHR_texture_compression_astc_sliced_3d, GL_MESA_framebuffer_flip_y, 
    GL_MESA_pack_invert, GL_MESA_shader_integer_functions, 
    GL_MESA_texture_signed_rgba, GL_MESA_window_pos, GL_NVX_gpu_memory_info, 
    GL_NV_ES1_1_compatibility, GL_NV_alpha_to_coverage_dither_control, 
    GL_NV_blend_square, GL_NV_compute_shader_derivatives, 
    GL_NV_conditional_render, GL_NV_copy_depth_to_color, GL_NV_copy_image, 
    GL_NV_depth_clamp, GL_NV_fog_distance, GL_NV_half_float, 
    GL_NV_light_max_exponent, GL_NV_packed_depth_stencil, 
    GL_NV_primitive_restart, GL_NV_shader_atomic_int64, 
    GL_NV_texgen_reflection, GL_NV_texture_barrier, 
    GL_NV_texture_env_combine4, GL_NV_texture_rectangle, GL_NV_vdpau_interop, 
    GL_OES_EGL_image, GL_OES_read_format, GL_S3_s3tc, 
    GL_SGIS_generate_mipmap, GL_SGIS_texture_border_clamp, 
    GL_SGIS_texture_edge_clamp, GL_SGIS_texture_lod, GL_SUN_multi_draw_arrays
Memory info (GL_ATI_meminfo):
    VBO free memory - total: 2522 MB, largest block: 2522 MB
    VBO free aux. memory - total: 15856 MB, largest block: 15856 MB
    Texture free memory - total: 2522 MB, largest block: 2522 MB
    Texture free aux. memory - total: 15856 MB, largest block: 15856 MB
    Renderbuffer free memory - total: 2522 MB, largest block: 2522 MB
    Renderbuffer free aux. memory - total: 15856 MB, largest block: 15856 MB
Memory info (GL_NVX_gpu_memory_info):
    Dedicated video memory: 4096 MB
    Total available memory: 20077 MB
    Currently available dedicated video memory: 2522 MB
OpenGL ES profile vendor: AMD
OpenGL ES profile renderer: AMD Radeon RX 5500 XT (navi14, LLVM 15.0.7, DRM 3.52, 6.3.9-arch1-1)
OpenGL ES profile version: OpenGL ES 3.2 Mesa 23.1.3
OpenGL ES profile shading language version: OpenGL ES GLSL ES 3.20
OpenGL ES profile extensions:
    GL_AMD_framebuffer_multisample_advanced, GL_AMD_performance_monitor, 
    GL_ANDROID_extension_pack_es31a, GL_ANGLE_pack_reverse_row_order, 
    GL_ANGLE_texture_compression_dxt3, GL_ANGLE_texture_compression_dxt5, 
    GL_APPLE_texture_max_level, GL_EXT_EGL_image_storage, 
    GL_EXT_base_instance, GL_EXT_blend_func_extended, GL_EXT_blend_minmax, 
    GL_EXT_buffer_storage, GL_EXT_clear_texture, GL_EXT_clip_control, 
    GL_EXT_clip_cull_distance, GL_EXT_color_buffer_float, 
    GL_EXT_color_buffer_half_float, GL_EXT_compressed_ETC1_RGB8_sub_texture, 
    GL_EXT_copy_image, GL_EXT_debug_label, GL_EXT_demote_to_helper_invocation, 
    GL_EXT_depth_clamp, GL_EXT_discard_framebuffer, 
    GL_EXT_disjoint_timer_query, GL_EXT_draw_buffers, 
    GL_EXT_draw_buffers_indexed, GL_EXT_draw_elements_base_vertex, 
    GL_EXT_draw_instanced, GL_EXT_float_blend, GL_EXT_frag_depth, 
    GL_EXT_geometry_point_size, GL_EXT_geometry_shader, GL_EXT_gpu_shader5, 
    GL_EXT_instanced_arrays, GL_EXT_map_buffer_range, GL_EXT_memory_object, 
    GL_EXT_memory_object_fd, GL_EXT_multi_draw_arrays, 
    GL_EXT_occlusion_query_boolean, GL_EXT_polygon_offset_clamp, 
    GL_EXT_primitive_bounding_box, GL_EXT_read_format_bgra, 
    GL_EXT_render_snorm, GL_EXT_robustness, GL_EXT_sRGB_write_control, 
    GL_EXT_semaphore, GL_EXT_semaphore_fd, GL_EXT_separate_shader_objects, 
    GL_EXT_shader_group_vote, GL_EXT_shader_implicit_conversions, 
    GL_EXT_shader_integer_mix, GL_EXT_shader_io_blocks, 
    GL_EXT_shader_samples_identical, GL_EXT_tessellation_point_size, 
    GL_EXT_tessellation_shader, GL_EXT_texture_border_clamp, 
    GL_EXT_texture_buffer, GL_EXT_texture_compression_bptc, 
    GL_EXT_texture_compression_dxt1, GL_EXT_texture_compression_rgtc, 
    GL_EXT_texture_compression_s3tc, GL_EXT_texture_compression_s3tc_srgb, 
    GL_EXT_texture_cube_map_array, GL_EXT_texture_filter_anisotropic, 
    GL_EXT_texture_format_BGRA8888, GL_EXT_texture_mirror_clamp_to_edge, 
    GL_EXT_texture_norm16, GL_EXT_texture_query_lod, GL_EXT_texture_rg, 
    GL_EXT_texture_sRGB_R8, GL_EXT_texture_sRGB_RG8, 
    GL_EXT_texture_sRGB_decode, GL_EXT_texture_shadow_lod, 
    GL_EXT_texture_type_2_10_10_10_REV, GL_EXT_texture_view, 
    GL_EXT_unpack_subimage, GL_EXT_window_rectangles, 
    GL_INTEL_blackhole_render, GL_KHR_blend_equation_advanced, 
    GL_KHR_context_flush_control, GL_KHR_debug, GL_KHR_no_error, 
    GL_KHR_parallel_shader_compile, GL_KHR_robust_buffer_access_behavior, 
    GL_KHR_robustness, GL_KHR_texture_compression_astc_ldr, 
    GL_KHR_texture_compression_astc_sliced_3d, GL_MESA_bgra, 
    GL_MESA_framebuffer_flip_y, GL_MESA_shader_integer_functions, 
    GL_NV_alpha_to_coverage_dither_control, GL_NV_compute_shader_derivatives, 
    GL_NV_conditional_render, GL_NV_draw_buffers, GL_NV_fbo_color_attachments, 
    GL_NV_generate_mipmap_sRGB, GL_NV_image_formats, GL_NV_pack_subimage, 
    GL_NV_pixel_buffer_object, GL_NV_read_buffer, GL_NV_read_depth, 
    GL_NV_read_depth_stencil, GL_NV_read_stencil, 
    GL_NV_shader_noperspective_interpolation, GL_OES_EGL_image, 
    GL_OES_EGL_image_external, GL_OES_EGL_image_external_essl3, 
    GL_OES_EGL_sync, GL_OES_compressed_ETC1_RGB8_texture, GL_OES_copy_image, 
    GL_OES_depth24, GL_OES_depth_texture, GL_OES_depth_texture_cube_map, 
    GL_OES_draw_buffers_indexed, GL_OES_draw_elements_base_vertex, 
    GL_OES_element_index_uint, GL_OES_fbo_render_mipmap, 
    GL_OES_geometry_point_size, GL_OES_geometry_shader, 
    GL_OES_get_program_binary, GL_OES_gpu_shader5, GL_OES_mapbuffer, 
    GL_OES_packed_depth_stencil, GL_OES_primitive_bounding_box, 
    GL_OES_required_internalformat, GL_OES_rgb8_rgba8, GL_OES_sample_shading, 
    GL_OES_sample_variables, GL_OES_shader_image_atomic, 
    GL_OES_shader_io_blocks, GL_OES_shader_multisample_interpolation, 
    GL_OES_standard_derivatives, GL_OES_stencil8, GL_OES_surfaceless_context, 
    GL_OES_tessellation_point_size, GL_OES_tessellation_shader, 
    GL_OES_texture_3D, GL_OES_texture_border_clamp, GL_OES_texture_buffer, 
    GL_OES_texture_cube_map_array, GL_OES_texture_float, 
    GL_OES_texture_float_linear, GL_OES_texture_half_float, 
    GL_OES_texture_half_float_linear, GL_OES_texture_npot, 
    GL_OES_texture_stencil8, GL_OES_texture_storage_multisample_2d_array, 
    GL_OES_texture_view, GL_OES_vertex_array_object, GL_OES_vertex_half_float, 
    GL_OES_viewport_array
Configurations:
     bf lv colorbuffer dp st  ms    vis   cav bi  renderable  supported
  id sz  l  r  g  b  a th cl ns b    id   eat nd gl es es2 vg surfaces 
---------------------------------------------------------------------
0x01 32  0 10 10 10  2  0  0  0 0 0x00--      a  y  y  y     pb
0x02 32  0 10 10 10  2 16  0  0 0 0x00--      a  y  y  y     pb
0x03 32  0 10 10 10  2 24  0  0 0 0x00--      a  y  y  y     pb
0x04 32  0 10 10 10  2 24  8  0 0 0x00--      a  y  y  y     pb
0x05 32  0 10 10 10  2  0  0  2 1 0x00--      a  y  y  y     pb
0x06 32  0 10 10 10  2  0  0  4 1 0x00--      a  y  y  y     pb
0x07 32  0 10 10 10  2  0  0  8 1 0x00--      a  y  y  y     pb
0x08 32  0 10 10 10  2 16  0  2 1 0x00--      a  y  y  y     pb
0x09 32  0 10 10 10  2 16  0  4 1 0x00--      a  y  y  y     pb
0x0a 32  0 10 10 10  2 16  0  8 1 0x00--      a  y  y  y     pb
0x0b 32  0 10 10 10  2 24  0  2 1 0x00--      a  y  y  y     pb
0x0c 32  0 10 10 10  2 24  0  4 1 0x00--      a  y  y  y     pb
0x0d 32  0 10 10 10  2 24  0  8 1 0x00--      a  y  y  y     pb
0x0e 32  0 10 10 10  2 24  8  2 1 0x00--      a  y  y  y     pb
0x0f 32  0 10 10 10  2 24  8  4 1 0x00--      a  y  y  y     pb
0x10 32  0 10 10 10  2 24  8  8 1 0x00--      a  y  y  y     pb
0x11 30  0 10 10 10  0  0  0  0 0 0x00--      y  y  y  y     pb
0x12 30  0 10 10 10  0 16  0  0 0 0x00--      y  y  y  y     pb
0x13 30  0 10 10 10  0 24  0  0 0 0x00--      y  y  y  y     pb
0x14 30  0 10 10 10  0 24  8  0 0 0x00--      y  y  y  y     pb
0x15 30  0 10 10 10  0  0  0  2 1 0x00--      y  y  y  y     pb
0x16 30  0 10 10 10  0  0  0  4 1 0x00--      y  y  y  y     pb
0x17 30  0 10 10 10  0  0  0  8 1 0x00--      y  y  y  y     pb
0x18 30  0 10 10 10  0 16  0  2 1 0x00--      y  y  y  y     pb
0x19 30  0 10 10 10  0 16  0  4 1 0x00--      y  y  y  y     pb
0x1a 30  0 10 10 10  0 16  0  8 1 0x00--      y  y  y  y     pb
0x1b 30  0 10 10 10  0 24  0  2 1 0x00--      y  y  y  y     pb
0x1c 30  0 10 10 10  0 24  0  4 1 0x00--      y  y  y  y     pb
0x1d 30  0 10 10 10  0 24  0  8 1 0x00--      y  y  y  y     pb
0x1e 30  0 10 10 10  0 24  8  2 1 0x00--      y  y  y  y     pb
0x1f 30  0 10 10 10  0 24  8  4 1 0x00--      y  y  y  y     pb
0x20 30  0 10 10 10  0 24  8  8 1 0x00--      y  y  y  y     pb
0x21 32  0  8  8  8  8  0  0  0 0 0x00--      a  y  y  y     pb
0x22 32  0  8  8  8  8 16  0  0 0 0x00--      a  y  y  y     pb
0x23 32  0  8  8  8  8 24  0  0 0 0x00--      a  y  y  y     pb
0x24 32  0  8  8  8  8 24  8  0 0 0x00--      a  y  y  y     pb
0x25 32  0  8  8  8  8  0  0  2 1 0x00--      a  y  y  y     pb
0x26 32  0  8  8  8  8  0  0  4 1 0x00--      a  y  y  y     pb
0x27 32  0  8  8  8  8  0  0  8 1 0x00--      a  y  y  y     pb
0x28 32  0  8  8  8  8 16  0  2 1 0x00--      a  y  y  y     pb
0x29 32  0  8  8  8  8 16  0  4 1 0x00--      a  y  y  y     pb
0x2a 32  0  8  8  8  8 16  0  8 1 0x00--      a  y  y  y     pb
0x2b 32  0  8  8  8  8 24  0  2 1 0x00--      a  y  y  y     pb
0x2c 32  0  8  8  8  8 24  0  4 1 0x00--      a  y  y  y     pb
0x2d 32  0  8  8  8  8 24  0  8 1 0x00--      a  y  y  y     pb
0x2e 32  0  8  8  8  8 24  8  2 1 0x00--      a  y  y  y     pb
0x2f 32  0  8  8  8  8 24  8  4 1 0x00--      a  y  y  y     pb
0x30 32  0  8  8  8  8 24  8  8 1 0x00--      a  y  y  y     pb
0x31 24  0  8  8  8  0  0  0  0 0 0x00--      y  y  y  y     pb
0x32 24  0  8  8  8  0 16  0  0 0 0x00--      y  y  y  y     pb
0x33 24  0  8  8  8  0 24  0  0 0 0x00--      y  y  y  y     pb
0x34 24  0  8  8  8  0 24  8  0 0 0x00--      y  y  y  y     pb
0x35 24  0  8  8  8  0  0  0  2 1 0x00--      y  y  y  y     pb
0x36 24  0  8  8  8  0  0  0  4 1 0x00--      y  y  y  y     pb
0x37 24  0  8  8  8  0  0  0  8 1 0x00--      y  y  y  y     pb
0x38 24  0  8  8  8  0 16  0  2 1 0x00--      y  y  y  y     pb
0x39 24  0  8  8  8  0 16  0  4 1 0x00--      y  y  y  y     pb
0x3a 24  0  8  8  8  0 16  0  8 1 0x00--      y  y  y  y     pb
0x3b 24  0  8  8  8  0 24  0  2 1 0x00--      y  y  y  y     pb
0x3c 24  0  8  8  8  0 24  0  4 1 0x00--      y  y  y  y     pb
0x3d 24  0  8  8  8  0 24  0  8 1 0x00--      y  y  y  y     pb
0x3e 24  0  8  8  8  0 24  8  2 1 0x00--      y  y  y  y     pb
0x3f 24  0  8  8  8  0 24  8  4 1 0x00--      y  y  y  y     pb
0x40 24  0  8  8  8  0 24  8  8 1 0x00--      y  y  y  y     pb
0x41 16  0  5  6  5  0  0  0  0 0 0x00--      y  y  y  y     pb
0x42 16  0  5  6  5  0 16  0  0 0 0x00--      y  y  y  y     pb
0x43 16  0  5  6  5  0 24  0  0 0 0x00--      y  y  y  y     pb
0x44 16  0  5  6  5  0 24  8  0 0 0x00--      y  y  y  y     pb
0x45 16  0  5  6  5  0  0  0  2 1 0x00--      y  y  y  y     pb
0x46 16  0  5  6  5  0  0  0  4 1 0x00--      y  y  y  y     pb
0x47 16  0  5  6  5  0  0  0  8 1 0x00--      y  y  y  y     pb
0x48 16  0  5  6  5  0 16  0  2 1 0x00--      y  y  y  y     pb
0x49 16  0  5  6  5  0 16  0  4 1 0x00--      y  y  y  y     pb
0x4a 16  0  5  6  5  0 16  0  8 1 0x00--      y  y  y  y     pb
0x4b 16  0  5  6  5  0 24  0  2 1 0x00--      y  y  y  y     pb
0x4c 16  0  5  6  5  0 24  0  4 1 0x00--      y  y  y  y     pb
0x4d 16  0  5  6  5  0 24  0  8 1 0x00--      y  y  y  y     pb
0x4e 16  0  5  6  5  0 24  8  2 1 0x00--      y  y  y  y     pb
0x4f 16  0  5  6  5  0 24  8  4 1 0x00--      y  y  y  y     pb
0x50 16  0  5  6  5  0 24  8  8 1 0x00--      y  y  y  y     pb
0x51 64  0 16 16 16 16  0  0  0 0 0x00--      a  y  y  y     pb
0x52 64  0 16 16 16 16 16  0  0 0 0x00--      a  y  y  y     pb
0x53 64  0 16 16 16 16 24  0  0 0 0x00--      a  y  y  y     pb
0x54 64  0 16 16 16 16 24  8  0 0 0x00--      a  y  y  y     pb
0x55 64  0 16 16 16 16  0  0  2 1 0x00--      a  y  y  y     pb
0x56 64  0 16 16 16 16  0  0  4 1 0x00--      a  y  y  y     pb
0x57 64  0 16 16 16 16  0  0  8 1 0x00--      a  y  y  y     pb
0x58 64  0 16 16 16 16 16  0  2 1 0x00--      a  y  y  y     pb
0x59 64  0 16 16 16 16 16  0  4 1 0x00--      a  y  y  y     pb
0x5a 64  0 16 16 16 16 16  0  8 1 0x00--      a  y  y  y     pb
0x5b 64  0 16 16 16 16 24  0  2 1 0x00--      a  y  y  y     pb
0x5c 64  0 16 16 16 16 24  0  4 1 0x00--      a  y  y  y     pb
0x5d 64  0 16 16 16 16 24  0  8 1 0x00--      a  y  y  y     pb
0x5e 64  0 16 16 16 16 24  8  2 1 0x00--      a  y  y  y     pb
0x5f 64  0 16 16 16 16 24  8  4 1 0x00--      a  y  y  y     pb
0x60 64  0 16 16 16 16 24  8  8 1 0x00--      a  y  y  y     pb
0x61 48  0 16 16 16  0  0  0  0 0 0x00--      y  y  y  y     pb
0x62 48  0 16 16 16  0 16  0  0 0 0x00--      y  y  y  y     pb
0x63 48  0 16 16 16  0 24  0  0 0 0x00--      y  y  y  y     pb
0x64 48  0 16 16 16  0 24  8  0 0 0x00--      y  y  y  y     pb
0x65 48  0 16 16 16  0  0  0  2 1 0x00--      y  y  y  y     pb
0x66 48  0 16 16 16  0  0  0  4 1 0x00--      y  y  y  y     pb
0x67 48  0 16 16 16  0  0  0  8 1 0x00--      y  y  y  y     pb
0x68 48  0 16 16 16  0 16  0  2 1 0x00--      y  y  y  y     pb
0x69 48  0 16 16 16  0 16  0  4 1 0x00--      y  y  y  y     pb
0x6a 48  0 16 16 16  0 16  0  8 1 0x00--      y  y  y  y     pb
0x6b 48  0 16 16 16  0 24  0  2 1 0x00--      y  y  y  y     pb
0x6c 48  0 16 16 16  0 24  0  4 1 0x00--      y  y  y  y     pb
0x6d 48  0 16 16 16  0 24  0  8 1 0x00--      y  y  y  y     pb
0x6e 48  0 16 16 16  0 24  8  2 1 0x00--      y  y  y  y     pb
0x6f 48  0 16 16 16  0 24  8  4 1 0x00--      y  y  y  y     pb
0x70 48  0 16 16 16  0 24  8  8 1 0x00--      y  y  y  y     pb

Device platform:
Device #0:

EGL device extensions string:
    EGL_EXT_device_drm, EGL_EXT_device_drm_render_node
Platform Device platform:
EGL API version: 1.5
EGL vendor string: Mesa Project
EGL version string: 1.5
EGL client APIs: OpenGL OpenGL_ES 
EGL driver name: iris
EGL extensions string:
    EGL_ANDROID_blob_cache, EGL_ANDROID_native_fence_sync, 
    EGL_EXT_create_context_robustness, EGL_EXT_image_dma_buf_import, 
    EGL_EXT_image_dma_buf_import_modifiers, EGL_EXT_pixel_format_float, 
    EGL_IMG_context_priority, EGL_KHR_cl_event2, EGL_KHR_config_attribs, 
    EGL_KHR_context_flush_control, EGL_KHR_create_context, 
    EGL_KHR_create_context_no_error, EGL_KHR_fence_sync, 
    EGL_KHR_get_all_proc_addresses, EGL_KHR_gl_colorspace, 
    EGL_KHR_gl_renderbuffer_image, EGL_KHR_gl_texture_2D_image, 
    EGL_KHR_gl_texture_3D_image, EGL_KHR_gl_texture_cubemap_image, 
    EGL_KHR_image_base, EGL_KHR_no_config_context, EGL_KHR_reusable_sync, 
    EGL_KHR_surfaceless_context, EGL_KHR_wait_sync, 
    EGL_MESA_configless_context, EGL_MESA_drm_image, 
    EGL_MESA_image_dma_buf_export, EGL_MESA_query_driver, 
    EGL_WL_bind_wayland_display
OpenGL core profile vendor: Intel
OpenGL core profile renderer: Mesa Intel(R) UHD Graphics 630 (CML GT2)
OpenGL core profile version: 4.6 (Core Profile) Mesa 23.1.3
OpenGL core profile shading language version: 4.60
OpenGL core profile extensions:
    GL_3DFX_texture_compression_FXT1, GL_AMD_conservative_depth, 
    GL_AMD_depth_clamp_separate, GL_AMD_draw_buffers_blend, 
    GL_AMD_gpu_shader_int64, GL_AMD_multi_draw_indirect, 
    GL_AMD_performance_monitor, GL_AMD_pinned_memory, 
    GL_AMD_query_buffer_object, GL_AMD_seamless_cubemap_per_texture, 
    GL_AMD_shader_stencil_export, GL_AMD_shader_trinary_minmax, 
    GL_AMD_texture_texture4, GL_AMD_vertex_shader_layer, 
    GL_AMD_vertex_shader_viewport_index, GL_ANGLE_texture_compression_dxt3, 
    GL_ANGLE_texture_compression_dxt5, GL_ARB_ES2_compatibility, 
    GL_ARB_ES3_1_compatibility, GL_ARB_ES3_2_compatibility, 
    GL_ARB_ES3_compatibility, GL_ARB_arrays_of_arrays, GL_ARB_base_instance, 
    GL_ARB_blend_func_extended, GL_ARB_buffer_storage, 
    GL_ARB_clear_buffer_object, GL_ARB_clear_texture, GL_ARB_clip_control, 
    GL_ARB_compressed_texture_pixel_storage, GL_ARB_compute_shader, 
    GL_ARB_compute_variable_group_size, GL_ARB_conditional_render_inverted, 
    GL_ARB_conservative_depth, GL_ARB_copy_buffer, GL_ARB_copy_image, 
    GL_ARB_cull_distance, GL_ARB_debug_output, GL_ARB_depth_buffer_float, 
    GL_ARB_depth_clamp, GL_ARB_derivative_control, GL_ARB_direct_state_access, 
    GL_ARB_draw_buffers, GL_ARB_draw_buffers_blend, 
    GL_ARB_draw_elements_base_vertex, GL_ARB_draw_indirect, 
    GL_ARB_draw_instanced, GL_ARB_enhanced_layouts, 
    GL_ARB_explicit_attrib_location, GL_ARB_explicit_uniform_location, 
    GL_ARB_fragment_coord_conventions, GL_ARB_fragment_layer_viewport, 
    GL_ARB_fragment_shader, GL_ARB_fragment_shader_interlock, 
    GL_ARB_framebuffer_no_attachments, GL_ARB_framebuffer_object, 
    GL_ARB_framebuffer_sRGB, GL_ARB_get_program_binary, 
    GL_ARB_get_texture_sub_image, GL_ARB_gl_spirv, GL_ARB_gpu_shader5, 
    GL_ARB_gpu_shader_fp64, GL_ARB_gpu_shader_int64, GL_ARB_half_float_pixel, 
    GL_ARB_half_float_vertex, GL_ARB_indirect_parameters, 
    GL_ARB_instanced_arrays, GL_ARB_internalformat_query, 
    GL_ARB_internalformat_query2, GL_ARB_invalidate_subdata, 
    GL_ARB_map_buffer_alignment, GL_ARB_map_buffer_range, GL_ARB_multi_bind, 
    GL_ARB_multi_draw_indirect, GL_ARB_occlusion_query2, 
    GL_ARB_parallel_shader_compile, GL_ARB_pipeline_statistics_query, 
    GL_ARB_pixel_buffer_object, GL_ARB_point_sprite, 
    GL_ARB_polygon_offset_clamp, GL_ARB_post_depth_coverage, 
    GL_ARB_program_interface_query, GL_ARB_provoking_vertex, 
    GL_ARB_query_buffer_object, GL_ARB_robust_buffer_access_behavior, 
    GL_ARB_robustness, GL_ARB_sample_shading, GL_ARB_sampler_objects, 
    GL_ARB_seamless_cube_map, GL_ARB_seamless_cubemap_per_texture, 
    GL_ARB_separate_shader_objects, GL_ARB_shader_atomic_counter_ops, 
    GL_ARB_shader_atomic_counters, GL_ARB_shader_ballot, 
    GL_ARB_shader_bit_encoding, GL_ARB_shader_clock, 
    GL_ARB_shader_draw_parameters, GL_ARB_shader_group_vote, 
    GL_ARB_shader_image_load_store, GL_ARB_shader_image_size, 
    GL_ARB_shader_objects, GL_ARB_shader_precision, 
    GL_ARB_shader_stencil_export, GL_ARB_shader_storage_buffer_object, 
    GL_ARB_shader_subroutine, GL_ARB_shader_texture_image_samples, 
    GL_ARB_shader_texture_lod, GL_ARB_shader_viewport_layer_array, 
    GL_ARB_shading_language_420pack, GL_ARB_shading_language_include, 
    GL_ARB_shading_language_packing, GL_ARB_spirv_extensions, 
    GL_ARB_stencil_texturing, GL_ARB_sync, GL_ARB_tessellation_shader, 
    GL_ARB_texture_barrier, GL_ARB_texture_buffer_object, 
    GL_ARB_texture_buffer_object_rgb32, GL_ARB_texture_buffer_range, 
    GL_ARB_texture_compression_bptc, GL_ARB_texture_compression_rgtc, 
    GL_ARB_texture_cube_map_array, GL_ARB_texture_filter_anisotropic, 
    GL_ARB_texture_float, GL_ARB_texture_gather, 
    GL_ARB_texture_mirror_clamp_to_edge, GL_ARB_texture_multisample, 
    GL_ARB_texture_non_power_of_two, GL_ARB_texture_query_levels, 
    GL_ARB_texture_query_lod, GL_ARB_texture_rectangle, GL_ARB_texture_rg, 
    GL_ARB_texture_rgb10_a2ui, GL_ARB_texture_stencil8, 
    GL_ARB_texture_storage, GL_ARB_texture_storage_multisample, 
    GL_ARB_texture_swizzle, GL_ARB_texture_view, GL_ARB_timer_query, 
    GL_ARB_transform_feedback2, GL_ARB_transform_feedback3, 
    GL_ARB_transform_feedback_instanced, 
    GL_ARB_transform_feedback_overflow_query, GL_ARB_uniform_buffer_object, 
    GL_ARB_vertex_array_bgra, GL_ARB_vertex_array_object, 
    GL_ARB_vertex_attrib_64bit, GL_ARB_vertex_attrib_binding, 
    GL_ARB_vertex_buffer_object, GL_ARB_vertex_shader, 
    GL_ARB_vertex_type_10f_11f_11f_rev, GL_ARB_vertex_type_2_10_10_10_rev, 
    GL_ARB_viewport_array, GL_ATI_blend_equation_separate, 
    GL_ATI_texture_float, GL_EXT_EGL_image_storage, GL_EXT_EGL_sync, 
    GL_EXT_abgr, GL_EXT_blend_equation_separate, GL_EXT_debug_label, 
    GL_EXT_demote_to_helper_invocation, GL_EXT_draw_buffers2, 
    GL_EXT_draw_instanced, GL_EXT_framebuffer_blit, 
    GL_EXT_framebuffer_multisample, GL_EXT_framebuffer_multisample_blit_scaled, 
    GL_EXT_framebuffer_object, GL_EXT_framebuffer_sRGB, GL_EXT_memory_object, 
    GL_EXT_memory_object_fd, GL_EXT_packed_depth_stencil, GL_EXT_packed_float, 
    GL_EXT_pixel_buffer_object, GL_EXT_polygon_offset_clamp, 
    GL_EXT_provoking_vertex, GL_EXT_semaphore, GL_EXT_semaphore_fd, 
    GL_EXT_shader_framebuffer_fetch, 
    GL_EXT_shader_framebuffer_fetch_non_coherent, GL_EXT_shader_integer_mix, 
    GL_EXT_shader_samples_identical, GL_EXT_texture_array, 
    GL_EXT_texture_compression_dxt1, GL_EXT_texture_compression_rgtc, 
    GL_EXT_texture_compression_s3tc, GL_EXT_texture_filter_anisotropic, 
    GL_EXT_texture_integer, GL_EXT_texture_sRGB, GL_EXT_texture_sRGB_R8, 
    GL_EXT_texture_sRGB_decode, GL_EXT_texture_shadow_lod, 
    GL_EXT_texture_shared_exponent, GL_EXT_texture_snorm, 
    GL_EXT_texture_swizzle, GL_EXT_timer_query, GL_EXT_transform_feedback, 
    GL_EXT_vertex_array_bgra, GL_EXT_vertex_attrib_64bit, 
    GL_IBM_multimode_draw_arrays, GL_INTEL_blackhole_render, 
    GL_INTEL_conservative_rasterization, GL_INTEL_performance_query, 
    GL_INTEL_shader_atomic_float_minmax, GL_INTEL_shader_integer_functions2, 
    GL_KHR_blend_equation_advanced, GL_KHR_blend_equation_advanced_coherent, 
    GL_KHR_context_flush_control, GL_KHR_debug, GL_KHR_no_error, 
    GL_KHR_parallel_shader_compile, GL_KHR_robust_buffer_access_behavior, 
    GL_KHR_robustness, GL_KHR_texture_compression_astc_ldr, 
    GL_KHR_texture_compression_astc_sliced_3d, GL_MESA_framebuffer_flip_y, 
    GL_MESA_pack_invert, GL_MESA_shader_integer_functions, 
    GL_MESA_texture_signed_rgba, GL_NV_alpha_to_coverage_dither_control, 
    GL_NV_compute_shader_derivatives, GL_NV_conditional_render, 
    GL_NV_copy_image, GL_NV_depth_clamp, GL_NV_fragment_shader_interlock, 
    GL_NV_packed_depth_stencil, GL_NV_texture_barrier, GL_OES_EGL_image, 
    GL_S3_s3tc
OpenGL compatibility profile vendor: Intel
OpenGL compatibility profile renderer: Mesa Intel(R) UHD Graphics 630 (CML GT2)
OpenGL compatibility profile version: 4.6 (Compatibility Profile) Mesa 23.1.3
OpenGL compatibility profile shading language version: 4.60
OpenGL compatibility profile extensions:
    GL_3DFX_texture_compression_FXT1, GL_AMD_conservative_depth, 
    GL_AMD_depth_clamp_separate, GL_AMD_draw_buffers_blend, 
    GL_AMD_multi_draw_indirect, GL_AMD_performance_monitor, 
    GL_AMD_pinned_memory, GL_AMD_query_buffer_object, 
    GL_AMD_seamless_cubemap_per_texture, GL_AMD_shader_stencil_export, 
    GL_AMD_shader_trinary_minmax, GL_AMD_texture_texture4, 
    GL_AMD_vertex_shader_layer, GL_AMD_vertex_shader_viewport_index, 
    GL_ANGLE_texture_compression_dxt3, GL_ANGLE_texture_compression_dxt5, 
    GL_APPLE_packed_pixels, GL_ARB_ES2_compatibility, 
    GL_ARB_ES3_1_compatibility, GL_ARB_ES3_2_compatibility, 
    GL_ARB_ES3_compatibility, GL_ARB_arrays_of_arrays, GL_ARB_base_instance, 
    GL_ARB_blend_func_extended, GL_ARB_buffer_storage, 
    GL_ARB_clear_buffer_object, GL_ARB_clear_texture, GL_ARB_clip_control, 
    GL_ARB_color_buffer_float, GL_ARB_compatibility, 
    GL_ARB_compressed_texture_pixel_storage, GL_ARB_compute_shader, 
    GL_ARB_compute_variable_group_size, GL_ARB_conditional_render_inverted, 
    GL_ARB_conservative_depth, GL_ARB_copy_buffer, GL_ARB_copy_image, 
    GL_ARB_cull_distance, GL_ARB_debug_output, GL_ARB_depth_buffer_float, 
    GL_ARB_depth_clamp, GL_ARB_depth_texture, GL_ARB_derivative_control, 
    GL_ARB_direct_state_access, GL_ARB_draw_buffers, 
    GL_ARB_draw_buffers_blend, GL_ARB_draw_elements_base_vertex, 
    GL_ARB_draw_indirect, GL_ARB_draw_instanced, GL_ARB_enhanced_layouts, 
    GL_ARB_explicit_attrib_location, GL_ARB_explicit_uniform_location, 
    GL_ARB_fragment_coord_conventions, GL_ARB_fragment_layer_viewport, 
    GL_ARB_fragment_program, GL_ARB_fragment_program_shadow, 
    GL_ARB_fragment_shader, GL_ARB_fragment_shader_interlock, 
    GL_ARB_framebuffer_no_attachments, GL_ARB_framebuffer_object, 
    GL_ARB_framebuffer_sRGB, GL_ARB_get_program_binary, 
    GL_ARB_get_texture_sub_image, GL_ARB_gl_spirv, GL_ARB_gpu_shader5, 
    GL_ARB_gpu_shader_fp64, GL_ARB_gpu_shader_int64, GL_ARB_half_float_pixel, 
    GL_ARB_half_float_vertex, GL_ARB_indirect_parameters, 
    GL_ARB_instanced_arrays, GL_ARB_internalformat_query, 
    GL_ARB_internalformat_query2, GL_ARB_invalidate_subdata, 
    GL_ARB_map_buffer_alignment, GL_ARB_map_buffer_range, GL_ARB_multi_bind, 
    GL_ARB_multi_draw_indirect, GL_ARB_multisample, GL_ARB_multitexture, 
    GL_ARB_occlusion_query, GL_ARB_occlusion_query2, 
    GL_ARB_parallel_shader_compile, GL_ARB_pipeline_statistics_query, 
    GL_ARB_pixel_buffer_object, GL_ARB_point_parameters, GL_ARB_point_sprite, 
    GL_ARB_polygon_offset_clamp, GL_ARB_post_depth_coverage, 
    GL_ARB_program_interface_query, GL_ARB_provoking_vertex, 
    GL_ARB_query_buffer_object, GL_ARB_robust_buffer_access_behavior, 
    GL_ARB_robustness, GL_ARB_sample_shading, GL_ARB_sampler_objects, 
    GL_ARB_seamless_cube_map, GL_ARB_seamless_cubemap_per_texture, 
    GL_ARB_separate_shader_objects, GL_ARB_shader_atomic_counter_ops, 
    GL_ARB_shader_atomic_counters, GL_ARB_shader_ballot, 
    GL_ARB_shader_bit_encoding, GL_ARB_shader_clock, 
    GL_ARB_shader_draw_parameters, GL_ARB_shader_group_vote, 
    GL_ARB_shader_image_load_store, GL_ARB_shader_image_size, 
    GL_ARB_shader_objects, GL_ARB_shader_precision, 
    GL_ARB_shader_stencil_export, GL_ARB_shader_storage_buffer_object, 
    GL_ARB_shader_subroutine, GL_ARB_shader_texture_image_samples, 
    GL_ARB_shader_texture_lod, GL_ARB_shader_viewport_layer_array, 
    GL_ARB_shading_language_100, GL_ARB_shading_language_420pack, 
    GL_ARB_shading_language_include, GL_ARB_shading_language_packing, 
    GL_ARB_shadow, GL_ARB_spirv_extensions, GL_ARB_stencil_texturing, 
    GL_ARB_sync, GL_ARB_tessellation_shader, GL_ARB_texture_barrier, 
    GL_ARB_texture_border_clamp, GL_ARB_texture_buffer_object, 
    GL_ARB_texture_buffer_object_rgb32, GL_ARB_texture_buffer_range, 
    GL_ARB_texture_compression, GL_ARB_texture_compression_bptc, 
    GL_ARB_texture_compression_rgtc, GL_ARB_texture_cube_map, 
    GL_ARB_texture_cube_map_array, GL_ARB_texture_env_add, 
    GL_ARB_texture_env_combine, GL_ARB_texture_env_crossbar, 
    GL_ARB_texture_env_dot3, GL_ARB_texture_filter_anisotropic, 
    GL_ARB_texture_float, GL_ARB_texture_gather, 
    GL_ARB_texture_mirror_clamp_to_edge, GL_ARB_texture_mirrored_repeat, 
    GL_ARB_texture_multisample, GL_ARB_texture_non_power_of_two, 
    GL_ARB_texture_query_levels, GL_ARB_texture_query_lod, 
    GL_ARB_texture_rectangle, GL_ARB_texture_rg, GL_ARB_texture_rgb10_a2ui, 
    GL_ARB_texture_stencil8, GL_ARB_texture_storage, 
    GL_ARB_texture_storage_multisample, GL_ARB_texture_swizzle, 
    GL_ARB_texture_view, GL_ARB_timer_query, GL_ARB_transform_feedback2, 
    GL_ARB_transform_feedback3, GL_ARB_transform_feedback_instanced, 
    GL_ARB_transform_feedback_overflow_query, GL_ARB_transpose_matrix, 
    GL_ARB_uniform_buffer_object, GL_ARB_vertex_array_bgra, 
    GL_ARB_vertex_array_object, GL_ARB_vertex_attrib_64bit, 
    GL_ARB_vertex_attrib_binding, GL_ARB_vertex_buffer_object, 
    GL_ARB_vertex_program, GL_ARB_vertex_shader, 
    GL_ARB_vertex_type_10f_11f_11f_rev, GL_ARB_vertex_type_2_10_10_10_rev, 
    GL_ARB_viewport_array, GL_ARB_window_pos, GL_ATI_blend_equation_separate, 
    GL_ATI_draw_buffers, GL_ATI_fragment_shader, GL_ATI_separate_stencil, 
    GL_ATI_texture_compression_3dc, GL_ATI_texture_env_combine3, 
    GL_ATI_texture_float, GL_EXT_EGL_image_storage, GL_EXT_EGL_sync, 
    GL_EXT_abgr, GL_EXT_bgra, GL_EXT_blend_color, 
    GL_EXT_blend_equation_separate, GL_EXT_blend_func_separate, 
    GL_EXT_blend_minmax, GL_EXT_blend_subtract, GL_EXT_compiled_vertex_array, 
    GL_EXT_copy_texture, GL_EXT_debug_label, 
    GL_EXT_demote_to_helper_invocation, GL_EXT_direct_state_access, 
    GL_EXT_draw_buffers2, GL_EXT_draw_instanced, GL_EXT_draw_range_elements, 
    GL_EXT_fog_coord, GL_EXT_framebuffer_blit, GL_EXT_framebuffer_multisample, 
    GL_EXT_framebuffer_multisample_blit_scaled, GL_EXT_framebuffer_object, 
    GL_EXT_framebuffer_sRGB, GL_EXT_gpu_program_parameters, 
    GL_EXT_gpu_shader4, GL_EXT_memory_object, GL_EXT_memory_object_fd, 
    GL_EXT_multi_draw_arrays, GL_EXT_packed_depth_stencil, 
    GL_EXT_packed_float, GL_EXT_packed_pixels, GL_EXT_pixel_buffer_object, 
    GL_EXT_point_parameters, GL_EXT_polygon_offset_clamp, 
    GL_EXT_provoking_vertex, GL_EXT_rescale_normal, GL_EXT_secondary_color, 
    GL_EXT_semaphore, GL_EXT_semaphore_fd, GL_EXT_separate_specular_color, 
    GL_EXT_shader_framebuffer_fetch, 
    GL_EXT_shader_framebuffer_fetch_non_coherent, GL_EXT_shader_integer_mix, 
    GL_EXT_shader_samples_identical, GL_EXT_shadow_funcs, 
    GL_EXT_stencil_two_side, GL_EXT_stencil_wrap, GL_EXT_subtexture, 
    GL_EXT_texture, GL_EXT_texture3D, GL_EXT_texture_array, 
    GL_EXT_texture_buffer_object, GL_EXT_texture_compression_dxt1, 
    GL_EXT_texture_compression_latc, GL_EXT_texture_compression_rgtc, 
    GL_EXT_texture_compression_s3tc, GL_EXT_texture_cube_map, 
    GL_EXT_texture_edge_clamp, GL_EXT_texture_env_add, 
    GL_EXT_texture_env_combine, GL_EXT_texture_env_dot3, 
    GL_EXT_texture_filter_anisotropic, GL_EXT_texture_integer, 
    GL_EXT_texture_lod_bias, GL_EXT_texture_object, GL_EXT_texture_rectangle, 
    GL_EXT_texture_sRGB, GL_EXT_texture_sRGB_R8, GL_EXT_texture_sRGB_decode, 
    GL_EXT_texture_shadow_lod, GL_EXT_texture_shared_exponent, 
    GL_EXT_texture_snorm, GL_EXT_texture_swizzle, GL_EXT_timer_query, 
    GL_EXT_transform_feedback, GL_EXT_vertex_array, GL_EXT_vertex_array_bgra, 
    GL_EXT_vertex_attrib_64bit, GL_IBM_multimode_draw_arrays, 
    GL_IBM_rasterpos_clip, GL_IBM_texture_mirrored_repeat, 
    GL_INGR_blend_func_separate, GL_INTEL_blackhole_render, 
    GL_INTEL_performance_query, GL_INTEL_shader_atomic_float_minmax, 
    GL_INTEL_shader_integer_functions2, GL_KHR_blend_equation_advanced, 
    GL_KHR_blend_equation_advanced_coherent, GL_KHR_context_flush_control, 
    GL_KHR_debug, GL_KHR_no_error, GL_KHR_parallel_shader_compile, 
    GL_KHR_robust_buffer_access_behavior, GL_KHR_robustness, 
    GL_KHR_texture_compression_astc_ldr, 
    GL_KHR_texture_compression_astc_sliced_3d, GL_MESA_framebuffer_flip_y, 
    GL_MESA_pack_invert, GL_MESA_shader_integer_functions, 
    GL_MESA_texture_signed_rgba, GL_MESA_window_pos, 
    GL_NV_ES1_1_compatibility, GL_NV_alpha_to_coverage_dither_control, 
    GL_NV_blend_square, GL_NV_compute_shader_derivatives, 
    GL_NV_conditional_render, GL_NV_copy_depth_to_color, GL_NV_copy_image, 
    GL_NV_depth_clamp, GL_NV_fog_distance, GL_NV_fragment_shader_interlock, 
    GL_NV_half_float, GL_NV_light_max_exponent, GL_NV_packed_depth_stencil, 
    GL_NV_primitive_restart, GL_NV_texgen_reflection, GL_NV_texture_barrier, 
    GL_NV_texture_env_combine4, GL_NV_texture_rectangle, GL_OES_EGL_image, 
    GL_OES_read_format, GL_S3_s3tc, GL_SGIS_generate_mipmap, 
    GL_SGIS_texture_border_clamp, GL_SGIS_texture_edge_clamp, 
    GL_SGIS_texture_lod, GL_SUN_multi_draw_arrays
OpenGL ES profile vendor: Intel
OpenGL ES profile renderer: Mesa Intel(R) UHD Graphics 630 (CML GT2)
OpenGL ES profile version: OpenGL ES 3.2 Mesa 23.1.3
OpenGL ES profile shading language version: OpenGL ES GLSL ES 3.20
OpenGL ES profile extensions:
    GL_AMD_performance_monitor, GL_ANDROID_extension_pack_es31a, 
    GL_ANGLE_pack_reverse_row_order, GL_ANGLE_texture_compression_dxt3, 
    GL_ANGLE_texture_compression_dxt5, GL_APPLE_texture_max_level, 
    GL_EXT_EGL_image_storage, GL_EXT_base_instance, 
    GL_EXT_blend_func_extended, GL_EXT_blend_minmax, GL_EXT_buffer_storage, 
    GL_EXT_clear_texture, GL_EXT_clip_control, GL_EXT_clip_cull_distance, 
    GL_EXT_color_buffer_float, GL_EXT_color_buffer_half_float, 
    GL_EXT_compressed_ETC1_RGB8_sub_texture, GL_EXT_copy_image, 
    GL_EXT_debug_label, GL_EXT_demote_to_helper_invocation, 
    GL_EXT_depth_clamp, GL_EXT_discard_framebuffer, 
    GL_EXT_disjoint_timer_query, GL_EXT_draw_buffers, 
    GL_EXT_draw_buffers_indexed, GL_EXT_draw_elements_base_vertex, 
    GL_EXT_draw_instanced, GL_EXT_float_blend, GL_EXT_frag_depth, 
    GL_EXT_geometry_point_size, GL_EXT_geometry_shader, GL_EXT_gpu_shader5, 
    GL_EXT_instanced_arrays, GL_EXT_map_buffer_range, GL_EXT_memory_object, 
    GL_EXT_memory_object_fd, GL_EXT_multi_draw_arrays, 
    GL_EXT_occlusion_query_boolean, GL_EXT_polygon_offset_clamp, 
    GL_EXT_primitive_bounding_box, GL_EXT_read_format_bgra, 
    GL_EXT_render_snorm, GL_EXT_robustness, GL_EXT_sRGB_write_control, 
    GL_EXT_semaphore, GL_EXT_semaphore_fd, GL_EXT_separate_shader_objects, 
    GL_EXT_shader_framebuffer_fetch, 
    GL_EXT_shader_framebuffer_fetch_non_coherent, GL_EXT_shader_group_vote, 
    GL_EXT_shader_implicit_conversions, GL_EXT_shader_integer_mix, 
    GL_EXT_shader_io_blocks, GL_EXT_shader_samples_identical, 
    GL_EXT_tessellation_point_size, GL_EXT_tessellation_shader, 
    GL_EXT_texture_border_clamp, GL_EXT_texture_buffer, 
    GL_EXT_texture_compression_bptc, GL_EXT_texture_compression_dxt1, 
    GL_EXT_texture_compression_rgtc, GL_EXT_texture_compression_s3tc, 
    GL_EXT_texture_compression_s3tc_srgb, GL_EXT_texture_cube_map_array, 
    GL_EXT_texture_filter_anisotropic, GL_EXT_texture_format_BGRA8888, 
    GL_EXT_texture_mirror_clamp_to_edge, GL_EXT_texture_norm16, 
    GL_EXT_texture_query_lod, GL_EXT_texture_rg, GL_EXT_texture_sRGB_R8, 
    GL_EXT_texture_sRGB_decode, GL_EXT_texture_shadow_lod, 
    GL_EXT_texture_type_2_10_10_10_REV, GL_EXT_texture_view, 
    GL_EXT_unpack_subimage, GL_INTEL_blackhole_render, 
    GL_INTEL_conservative_rasterization, GL_INTEL_performance_query, 
    GL_KHR_blend_equation_advanced, GL_KHR_blend_equation_advanced_coherent, 
    GL_KHR_context_flush_control, GL_KHR_debug, GL_KHR_no_error, 
    GL_KHR_parallel_shader_compile, GL_KHR_robust_buffer_access_behavior, 
    GL_KHR_robustness, GL_KHR_texture_compression_astc_ldr, 
    GL_KHR_texture_compression_astc_sliced_3d, GL_MESA_bgra, 
    GL_MESA_framebuffer_flip_y, GL_MESA_shader_integer_functions, 
    GL_NV_alpha_to_coverage_dither_control, GL_NV_compute_shader_derivatives, 
    GL_NV_conditional_render, GL_NV_draw_buffers, GL_NV_fbo_color_attachments, 
    GL_NV_fragment_shader_interlock, GL_NV_generate_mipmap_sRGB, 
    GL_NV_image_formats, GL_NV_pack_subimage, GL_NV_pixel_buffer_object, 
    GL_NV_read_buffer, GL_NV_read_depth, GL_NV_read_depth_stencil, 
    GL_NV_read_stencil, GL_NV_shader_noperspective_interpolation, 
    GL_OES_EGL_image, GL_OES_EGL_image_external, 
    GL_OES_EGL_image_external_essl3, GL_OES_EGL_sync, 
    GL_OES_compressed_ETC1_RGB8_texture, GL_OES_copy_image, GL_OES_depth24, 
    GL_OES_depth_texture, GL_OES_depth_texture_cube_map, 
    GL_OES_draw_buffers_indexed, GL_OES_draw_elements_base_vertex, 
    GL_OES_element_index_uint, GL_OES_fbo_render_mipmap, 
    GL_OES_geometry_point_size, GL_OES_geometry_shader, 
    GL_OES_get_program_binary, GL_OES_gpu_shader5, GL_OES_mapbuffer, 
    GL_OES_packed_depth_stencil, GL_OES_primitive_bounding_box, 
    GL_OES_required_internalformat, GL_OES_rgb8_rgba8, GL_OES_sample_shading, 
    GL_OES_sample_variables, GL_OES_shader_image_atomic, 
    GL_OES_shader_io_blocks, GL_OES_shader_multisample_interpolation, 
    GL_OES_standard_derivatives, GL_OES_stencil8, GL_OES_surfaceless_context, 
    GL_OES_tessellation_point_size, GL_OES_tessellation_shader, 
    GL_OES_texture_3D, GL_OES_texture_border_clamp, GL_OES_texture_buffer, 
    GL_OES_texture_cube_map_array, GL_OES_texture_float, 
    GL_OES_texture_float_linear, GL_OES_texture_half_float, 
    GL_OES_texture_half_float_linear, GL_OES_texture_npot, 
    GL_OES_texture_stencil8, GL_OES_texture_storage_multisample_2d_array, 
    GL_OES_texture_view, GL_OES_vertex_array_object, GL_OES_vertex_half_float, 
    GL_OES_viewport_array
Configurations:
     bf lv colorbuffer dp st  ms    vis   cav bi  renderable  supported
  id sz  l  r  g  b  a th cl ns b    id   eat nd gl es es2 vg surfaces 
---------------------------------------------------------------------
0x01 32  0 10 10 10  2  0  0  0 0 0x00--      a  y  y  y     pb
0x02 32  0 10 10 10  2 16  0  0 0 0x00--      a  y  y  y     pb
0x03 32  0 10 10 10  2 24  0  0 0 0x00--      a  y  y  y     pb
0x04 32  0 10 10 10  2 24  8  0 0 0x00--      a  y  y  y     pb
0x05 32  0 10 10 10  2  0  0  2 1 0x00--      a  y  y  y     pb
0x06 32  0 10 10 10  2  0  0  4 1 0x00--      a  y  y  y     pb
0x07 32  0 10 10 10  2  0  0  8 1 0x00--      a  y  y  y     pb
0x08 32  0 10 10 10  2  0  0 16 1 0x00--      a  y  y  y     pb
0x09 32  0 10 10 10  2 16  0  2 1 0x00--      a  y  y  y     pb
0x0a 32  0 10 10 10  2 16  0  4 1 0x00--      a  y  y  y     pb
0x0b 32  0 10 10 10  2 16  0  8 1 0x00--      a  y  y  y     pb
0x0c 32  0 10 10 10  2 16  0 16 1 0x00--      a  y  y  y     pb
0x0d 32  0 10 10 10  2 24  0  2 1 0x00--      a  y  y  y     pb
0x0e 32  0 10 10 10  2 24  0  4 1 0x00--      a  y  y  y     pb
0x0f 32  0 10 10 10  2 24  0  8 1 0x00--      a  y  y  y     pb
0x10 32  0 10 10 10  2 24  0 16 1 0x00--      a  y  y  y     pb
0x11 32  0 10 10 10  2 24  8  2 1 0x00--      a  y  y  y     pb
0x12 32  0 10 10 10  2 24  8  4 1 0x00--      a  y  y  y     pb
0x13 32  0 10 10 10  2 24  8  8 1 0x00--      a  y  y  y     pb
0x14 32  0 10 10 10  2 24  8 16 1 0x00--      a  y  y  y     pb
0x15 30  0 10 10 10  0  0  0  0 0 0x00--      y  y  y  y     pb
0x16 30  0 10 10 10  0 16  0  0 0 0x00--      y  y  y  y     pb
0x17 30  0 10 10 10  0 24  0  0 0 0x00--      y  y  y  y     pb
0x18 30  0 10 10 10  0 24  8  0 0 0x00--      y  y  y  y     pb
0x19 30  0 10 10 10  0  0  0  2 1 0x00--      y  y  y  y     pb
0x1a 30  0 10 10 10  0  0  0  4 1 0x00--      y  y  y  y     pb
0x1b 30  0 10 10 10  0  0  0  8 1 0x00--      y  y  y  y     pb
0x1c 30  0 10 10 10  0  0  0 16 1 0x00--      y  y  y  y     pb
0x1d 30  0 10 10 10  0 16  0  2 1 0x00--      y  y  y  y     pb
0x1e 30  0 10 10 10  0 16  0  4 1 0x00--      y  y  y  y     pb
0x1f 30  0 10 10 10  0 16  0  8 1 0x00--      y  y  y  y     pb
0x20 30  0 10 10 10  0 16  0 16 1 0x00--      y  y  y  y     pb
0x21 30  0 10 10 10  0 24  0  2 1 0x00--      y  y  y  y     pb
0x22 30  0 10 10 10  0 24  0  4 1 0x00--      y  y  y  y     pb
0x23 30  0 10 10 10  0 24  0  8 1 0x00--      y  y  y  y     pb
0x24 30  0 10 10 10  0 24  0 16 1 0x00--      y  y  y  y     pb
0x25 30  0 10 10 10  0 24  8  2 1 0x00--      y  y  y  y     pb
0x26 30  0 10 10 10  0 24  8  4 1 0x00--      y  y  y  y     pb
0x27 30  0 10 10 10  0 24  8  8 1 0x00--      y  y  y  y     pb
0x28 30  0 10 10 10  0 24  8 16 1 0x00--      y  y  y  y     pb
0x29 32  0  8  8  8  8  0  0  0 0 0x00--      a  y  y  y     pb
0x2a 32  0  8  8  8  8 16  0  0 0 0x00--      a  y  y  y     pb
0x2b 32  0  8  8  8  8 24  0  0 0 0x00--      a  y  y  y     pb
0x2c 32  0  8  8  8  8 24  8  0 0 0x00--      a  y  y  y     pb
0x2d 32  0  8  8  8  8  0  0  2 1 0x00--      a  y  y  y     pb
0x2e 32  0  8  8  8  8  0  0  4 1 0x00--      a  y  y  y     pb
0x2f 32  0  8  8  8  8  0  0  8 1 0x00--      a  y  y  y     pb
0x30 32  0  8  8  8  8  0  0 16 1 0x00--      a  y  y  y     pb
0x31 32  0  8  8  8  8 16  0  2 1 0x00--      a  y  y  y     pb
0x32 32  0  8  8  8  8 16  0  4 1 0x00--      a  y  y  y     pb
0x33 32  0  8  8  8  8 16  0  8 1 0x00--      a  y  y  y     pb
0x34 32  0  8  8  8  8 16  0 16 1 0x00--      a  y  y  y     pb
0x35 32  0  8  8  8  8 24  0  2 1 0x00--      a  y  y  y     pb
0x36 32  0  8  8  8  8 24  0  4 1 0x00--      a  y  y  y     pb
0x37 32  0  8  8  8  8 24  0  8 1 0x00--      a  y  y  y     pb
0x38 32  0  8  8  8  8 24  0 16 1 0x00--      a  y  y  y     pb
0x39 32  0  8  8  8  8 24  8  2 1 0x00--      a  y  y  y     pb
0x3a 32  0  8  8  8  8 24  8  4 1 0x00--      a  y  y  y     pb
0x3b 32  0  8  8  8  8 24  8  8 1 0x00--      a  y  y  y     pb
0x3c 32  0  8  8  8  8 24  8 16 1 0x00--      a  y  y  y     pb
0x3d 24  0  8  8  8  0  0  0  0 0 0x00--      y  y  y  y     pb
0x3e 24  0  8  8  8  0 16  0  0 0 0x00--      y  y  y  y     pb
0x3f 24  0  8  8  8  0 24  0  0 0 0x00--      y  y  y  y     pb
0x40 24  0  8  8  8  0 24  8  0 0 0x00--      y  y  y  y     pb
0x41 24  0  8  8  8  0  0  0  2 1 0x00--      y  y  y  y     pb
0x42 24  0  8  8  8  0  0  0  4 1 0x00--      y  y  y  y     pb
0x43 24  0  8  8  8  0  0  0  8 1 0x00--      y  y  y  y     pb
0x44 24  0  8  8  8  0  0  0 16 1 0x00--      y  y  y  y     pb
0x45 24  0  8  8  8  0 16  0  2 1 0x00--      y  y  y  y     pb
0x46 24  0  8  8  8  0 16  0  4 1 0x00--      y  y  y  y     pb
0x47 24  0  8  8  8  0 16  0  8 1 0x00--      y  y  y  y     pb
0x48 24  0  8  8  8  0 16  0 16 1 0x00--      y  y  y  y     pb
0x49 24  0  8  8  8  0 24  0  2 1 0x00--      y  y  y  y     pb
0x4a 24  0  8  8  8  0 24  0  4 1 0x00--      y  y  y  y     pb
0x4b 24  0  8  8  8  0 24  0  8 1 0x00--      y  y  y  y     pb
0x4c 24  0  8  8  8  0 24  0 16 1 0x00--      y  y  y  y     pb
0x4d 24  0  8  8  8  0 24  8  2 1 0x00--      y  y  y  y     pb
0x4e 24  0  8  8  8  0 24  8  4 1 0x00--      y  y  y  y     pb
0x4f 24  0  8  8  8  0 24  8  8 1 0x00--      y  y  y  y     pb
0x50 24  0  8  8  8  0 24  8 16 1 0x00--      y  y  y  y     pb
0x51 16  0  5  6  5  0  0  0  0 0 0x00--      y  y  y  y     pb
0x52 16  0  5  6  5  0 16  0  0 0 0x00--      y  y  y  y     pb
0x53 16  0  5  6  5  0 24  0  0 0 0x00--      y  y  y  y     pb
0x54 16  0  5  6  5  0 24  8  0 0 0x00--      y  y  y  y     pb
0x55 16  0  5  6  5  0  0  0  2 1 0x00--      y  y  y  y     pb
0x56 16  0  5  6  5  0  0  0  4 1 0x00--      y  y  y  y     pb
0x57 16  0  5  6  5  0  0  0  8 1 0x00--      y  y  y  y     pb
0x58 16  0  5  6  5  0  0  0 16 1 0x00--      y  y  y  y     pb
0x59 16  0  5  6  5  0 16  0  2 1 0x00--      y  y  y  y     pb
0x5a 16  0  5  6  5  0 16  0  4 1 0x00--      y  y  y  y     pb
0x5b 16  0  5  6  5  0 16  0  8 1 0x00--      y  y  y  y     pb
0x5c 16  0  5  6  5  0 16  0 16 1 0x00--      y  y  y  y     pb
0x5d 16  0  5  6  5  0 24  0  2 1 0x00--      y  y  y  y     pb
0x5e 16  0  5  6  5  0 24  0  4 1 0x00--      y  y  y  y     pb
0x5f 16  0  5  6  5  0 24  0  8 1 0x00--      y  y  y  y     pb
0x60 16  0  5  6  5  0 24  0 16 1 0x00--      y  y  y  y     pb
0x61 16  0  5  6  5  0 24  8  2 1 0x00--      y  y  y  y     pb
0x62 16  0  5  6  5  0 24  8  4 1 0x00--      y  y  y  y     pb
0x63 16  0  5  6  5  0 24  8  8 1 0x00--      y  y  y  y     pb
0x64 16  0  5  6  5  0 24  8 16 1 0x00--      y  y  y  y     pb
0x65 64  0 16 16 16 16  0  0  0 0 0x00--      a  y  y  y     pb
0x66 64  0 16 16 16 16 16  0  0 0 0x00--      a  y  y  y     pb
0x67 64  0 16 16 16 16 24  0  0 0 0x00--      a  y  y  y     pb
0x68 64  0 16 16 16 16 24  8  0 0 0x00--      a  y  y  y     pb
0x69 64  0 16 16 16 16  0  0  2 1 0x00--      a  y  y  y     pb
0x6a 64  0 16 16 16 16  0  0  4 1 0x00--      a  y  y  y     pb
0x6b 64  0 16 16 16 16  0  0  8 1 0x00--      a  y  y  y     pb
0x6c 64  0 16 16 16 16  0  0 16 1 0x00--      a  y  y  y     pb
0x6d 64  0 16 16 16 16 16  0  2 1 0x00--      a  y  y  y     pb
0x6e 64  0 16 16 16 16 16  0  4 1 0x00--      a  y  y  y     pb
0x6f 64  0 16 16 16 16 16  0  8 1 0x00--      a  y  y  y     pb
0x70 64  0 16 16 16 16 16  0 16 1 0x00--      a  y  y  y     pb
0x71 64  0 16 16 16 16 24  0  2 1 0x00--      a  y  y  y     pb
0x72 64  0 16 16 16 16 24  0  4 1 0x00--      a  y  y  y     pb
0x73 64  0 16 16 16 16 24  0  8 1 0x00--      a  y  y  y     pb
0x74 64  0 16 16 16 16 24  0 16 1 0x00--      a  y  y  y     pb
0x75 64  0 16 16 16 16 24  8  2 1 0x00--      a  y  y  y     pb
0x76 64  0 16 16 16 16 24  8  4 1 0x00--      a  y  y  y     pb
0x77 64  0 16 16 16 16 24  8  8 1 0x00--      a  y  y  y     pb
0x78 64  0 16 16 16 16 24  8 16 1 0x00--      a  y  y  y     pb
0x79 48  0 16 16 16  0  0  0  0 0 0x00--      y  y  y  y     pb
0x7a 48  0 16 16 16  0 16  0  0 0 0x00--      y  y  y  y     pb
0x7b 48  0 16 16 16  0 24  0  0 0 0x00--      y  y  y  y     pb
0x7c 48  0 16 16 16  0 24  8  0 0 0x00--      y  y  y  y     pb
0x7d 48  0 16 16 16  0  0  0  2 1 0x00--      y  y  y  y     pb
0x7e 48  0 16 16 16  0  0  0  4 1 0x00--      y  y  y  y     pb
0x7f 48  0 16 16 16  0  0  0  8 1 0x00--      y  y  y  y     pb
0x80 48  0 16 16 16  0  0  0 16 1 0x00--      y  y  y  y     pb
0x81 48  0 16 16 16  0 16  0  2 1 0x00--      y  y  y  y     pb
0x82 48  0 16 16 16  0 16  0  4 1 0x00--      y  y  y  y     pb
0x83 48  0 16 16 16  0 16  0  8 1 0x00--      y  y  y  y     pb
0x84 48  0 16 16 16  0 16  0 16 1 0x00--      y  y  y  y     pb
0x85 48  0 16 16 16  0 24  0  2 1 0x00--      y  y  y  y     pb
0x86 48  0 16 16 16  0 24  0  4 1 0x00--      y  y  y  y     pb
0x87 48  0 16 16 16  0 24  0  8 1 0x00--      y  y  y  y     pb
0x88 48  0 16 16 16  0 24  0 16 1 0x00--      y  y  y  y     pb
0x89 48  0 16 16 16  0 24  8  2 1 0x00--      y  y  y  y     pb
0x8a 48  0 16 16 16  0 24  8  4 1 0x00--      y  y  y  y     pb
0x8b 48  0 16 16 16  0 24  8  8 1 0x00--      y  y  y  y     pb
0x8c 48  0 16 16 16  0 24  8 16 1 0x00--      y  y  y  y     pb

Device #1:

EGL device extensions string:
    EGL_EXT_device_drm, EGL_EXT_device_drm_render_node
Platform Device platform:
EGL API version: 1.5
EGL vendor string: Mesa Project
EGL version string: 1.5
EGL client APIs: OpenGL OpenGL_ES 
EGL driver name: radeonsi
EGL extensions string:
    EGL_ANDROID_blob_cache, EGL_ANDROID_native_fence_sync, 
    EGL_EXT_create_context_robustness, EGL_EXT_image_dma_buf_import, 
    EGL_EXT_image_dma_buf_import_modifiers, EGL_EXT_pixel_format_float, 
    EGL_IMG_context_priority, EGL_KHR_cl_event2, EGL_KHR_config_attribs, 
    EGL_KHR_context_flush_control, EGL_KHR_create_context, 
    EGL_KHR_create_context_no_error, EGL_KHR_fence_sync, 
    EGL_KHR_get_all_proc_addresses, EGL_KHR_gl_colorspace, 
    EGL_KHR_gl_renderbuffer_image, EGL_KHR_gl_texture_2D_image, 
    EGL_KHR_gl_texture_3D_image, EGL_KHR_gl_texture_cubemap_image, 
    EGL_KHR_image_base, EGL_KHR_no_config_context, EGL_KHR_reusable_sync, 
    EGL_KHR_surfaceless_context, EGL_KHR_wait_sync, 
    EGL_MESA_configless_context, EGL_MESA_drm_image, 
    EGL_MESA_image_dma_buf_export, EGL_MESA_query_driver, 
    EGL_WL_bind_wayland_display
OpenGL core profile vendor: AMD
OpenGL core profile renderer: AMD Radeon RX 5500 XT (navi14, LLVM 15.0.7, DRM 3.52, 6.3.9-arch1-1)
OpenGL core profile version: 4.6 (Core Profile) Mesa 23.1.3
OpenGL core profile shading language version: 4.60
OpenGL core profile extensions:
    GL_AMD_conservative_depth, GL_AMD_depth_clamp_separate, 
    GL_AMD_draw_buffers_blend, GL_AMD_framebuffer_multisample_advanced, 
    GL_AMD_gpu_shader_int64, GL_AMD_multi_draw_indirect, 
    GL_AMD_performance_monitor, GL_AMD_pinned_memory, 
    GL_AMD_query_buffer_object, GL_AMD_seamless_cubemap_per_texture, 
    GL_AMD_shader_stencil_export, GL_AMD_shader_trinary_minmax, 
    GL_AMD_texture_texture4, GL_AMD_vertex_shader_layer, 
    GL_AMD_vertex_shader_viewport_index, GL_ANGLE_texture_compression_dxt3, 
    GL_ANGLE_texture_compression_dxt5, GL_ARB_ES2_compatibility, 
    GL_ARB_ES3_1_compatibility, GL_ARB_ES3_2_compatibility, 
    GL_ARB_ES3_compatibility, GL_ARB_arrays_of_arrays, GL_ARB_base_instance, 
    GL_ARB_bindless_texture, GL_ARB_blend_func_extended, 
    GL_ARB_buffer_storage, GL_ARB_clear_buffer_object, GL_ARB_clear_texture, 
    GL_ARB_clip_control, GL_ARB_color_buffer_float, 
    GL_ARB_compressed_texture_pixel_storage, GL_ARB_compute_shader, 
    GL_ARB_compute_variable_group_size, GL_ARB_conditional_render_inverted, 
    GL_ARB_conservative_depth, GL_ARB_copy_buffer, GL_ARB_copy_image, 
    GL_ARB_cull_distance, GL_ARB_debug_output, GL_ARB_depth_buffer_float, 
    GL_ARB_depth_clamp, GL_ARB_derivative_control, GL_ARB_direct_state_access, 
    GL_ARB_draw_buffers, GL_ARB_draw_buffers_blend, 
    GL_ARB_draw_elements_base_vertex, GL_ARB_draw_indirect, 
    GL_ARB_draw_instanced, GL_ARB_enhanced_layouts, 
    GL_ARB_explicit_attrib_location, GL_ARB_explicit_uniform_location, 
    GL_ARB_fragment_coord_conventions, GL_ARB_fragment_layer_viewport, 
    GL_ARB_fragment_shader, GL_ARB_framebuffer_no_attachments, 
    GL_ARB_framebuffer_object, GL_ARB_framebuffer_sRGB, 
    GL_ARB_get_program_binary, GL_ARB_get_texture_sub_image, GL_ARB_gl_spirv, 
    GL_ARB_gpu_shader5, GL_ARB_gpu_shader_fp64, GL_ARB_gpu_shader_int64, 
    GL_ARB_half_float_pixel, GL_ARB_half_float_vertex, 
    GL_ARB_indirect_parameters, GL_ARB_instanced_arrays, 
    GL_ARB_internalformat_query, GL_ARB_internalformat_query2, 
    GL_ARB_invalidate_subdata, GL_ARB_map_buffer_alignment, 
    GL_ARB_map_buffer_range, GL_ARB_multi_bind, GL_ARB_multi_draw_indirect, 
    GL_ARB_occlusion_query2, GL_ARB_parallel_shader_compile, 
    GL_ARB_pipeline_statistics_query, GL_ARB_pixel_buffer_object, 
    GL_ARB_point_sprite, GL_ARB_polygon_offset_clamp, 
    GL_ARB_post_depth_coverage, GL_ARB_program_interface_query, 
    GL_ARB_provoking_vertex, GL_ARB_query_buffer_object, 
    GL_ARB_robust_buffer_access_behavior, GL_ARB_robustness, 
    GL_ARB_sample_shading, GL_ARB_sampler_objects, GL_ARB_seamless_cube_map, 
    GL_ARB_seamless_cubemap_per_texture, GL_ARB_separate_shader_objects, 
    GL_ARB_shader_atomic_counter_ops, GL_ARB_shader_atomic_counters, 
    GL_ARB_shader_ballot, GL_ARB_shader_bit_encoding, GL_ARB_shader_clock, 
    GL_ARB_shader_draw_parameters, GL_ARB_shader_group_vote, 
    GL_ARB_shader_image_load_store, GL_ARB_shader_image_size, 
    GL_ARB_shader_objects, GL_ARB_shader_precision, 
    GL_ARB_shader_stencil_export, GL_ARB_shader_storage_buffer_object, 
    GL_ARB_shader_subroutine, GL_ARB_shader_texture_image_samples, 
    GL_ARB_shader_texture_lod, GL_ARB_shader_viewport_layer_array, 
    GL_ARB_shading_language_420pack, GL_ARB_shading_language_include, 
    GL_ARB_shading_language_packing, GL_ARB_sparse_buffer, 
    GL_ARB_sparse_texture, GL_ARB_sparse_texture2, 
    GL_ARB_sparse_texture_clamp, GL_ARB_spirv_extensions, 
    GL_ARB_stencil_texturing, GL_ARB_sync, GL_ARB_tessellation_shader, 
    GL_ARB_texture_barrier, GL_ARB_texture_buffer_object, 
    GL_ARB_texture_buffer_object_rgb32, GL_ARB_texture_buffer_range, 
    GL_ARB_texture_compression_bptc, GL_ARB_texture_compression_rgtc, 
    GL_ARB_texture_cube_map_array, GL_ARB_texture_filter_anisotropic, 
    GL_ARB_texture_float, GL_ARB_texture_gather, 
    GL_ARB_texture_mirror_clamp_to_edge, GL_ARB_texture_multisample, 
    GL_ARB_texture_non_power_of_two, GL_ARB_texture_query_levels, 
    GL_ARB_texture_query_lod, GL_ARB_texture_rectangle, GL_ARB_texture_rg, 
    GL_ARB_texture_rgb10_a2ui, GL_ARB_texture_stencil8, 
    GL_ARB_texture_storage, GL_ARB_texture_storage_multisample, 
    GL_ARB_texture_swizzle, GL_ARB_texture_view, GL_ARB_timer_query, 
    GL_ARB_transform_feedback2, GL_ARB_transform_feedback3, 
    GL_ARB_transform_feedback_instanced, 
    GL_ARB_transform_feedback_overflow_query, GL_ARB_uniform_buffer_object, 
    GL_ARB_vertex_array_bgra, GL_ARB_vertex_array_object, 
    GL_ARB_vertex_attrib_64bit, GL_ARB_vertex_attrib_binding, 
    GL_ARB_vertex_buffer_object, GL_ARB_vertex_shader, 
    GL_ARB_vertex_type_10f_11f_11f_rev, GL_ARB_vertex_type_2_10_10_10_rev, 
    GL_ARB_viewport_array, GL_ATI_blend_equation_separate, GL_ATI_meminfo, 
    GL_ATI_texture_float, GL_ATI_texture_mirror_once, 
    GL_EXT_EGL_image_storage, GL_EXT_EGL_sync, GL_EXT_abgr, 
    GL_EXT_blend_equation_separate, GL_EXT_debug_label, 
    GL_EXT_demote_to_helper_invocation, GL_EXT_depth_bounds_test, 
    GL_EXT_draw_buffers2, GL_EXT_draw_instanced, GL_EXT_framebuffer_blit, 
    GL_EXT_framebuffer_multisample, GL_EXT_framebuffer_multisample_blit_scaled, 
    GL_EXT_framebuffer_object, GL_EXT_framebuffer_sRGB, GL_EXT_memory_object, 
    GL_EXT_memory_object_fd, GL_EXT_packed_depth_stencil, GL_EXT_packed_float, 
    GL_EXT_pixel_buffer_object, GL_EXT_polygon_offset_clamp, 
    GL_EXT_provoking_vertex, GL_EXT_semaphore, GL_EXT_semaphore_fd, 
    GL_EXT_shader_image_load_formatted, GL_EXT_shader_image_load_store, 
    GL_EXT_shader_integer_mix, GL_EXT_shader_samples_identical, 
    GL_EXT_texture_array, GL_EXT_texture_compression_dxt1, 
    GL_EXT_texture_compression_rgtc, GL_EXT_texture_compression_s3tc, 
    GL_EXT_texture_filter_anisotropic, GL_EXT_texture_integer, 
    GL_EXT_texture_mirror_clamp, GL_EXT_texture_sRGB, GL_EXT_texture_sRGB_R8, 
    GL_EXT_texture_sRGB_RG8, GL_EXT_texture_sRGB_decode, 
    GL_EXT_texture_shadow_lod, GL_EXT_texture_shared_exponent, 
    GL_EXT_texture_snorm, GL_EXT_texture_swizzle, GL_EXT_timer_query, 
    GL_EXT_transform_feedback, GL_EXT_vertex_array_bgra, 
    GL_EXT_vertex_attrib_64bit, GL_EXT_window_rectangles, 
    GL_IBM_multimode_draw_arrays, GL_INTEL_blackhole_render, 
    GL_KHR_blend_equation_advanced, GL_KHR_context_flush_control, 
    GL_KHR_debug, GL_KHR_no_error, GL_KHR_parallel_shader_compile, 
    GL_KHR_robust_buffer_access_behavior, GL_KHR_robustness, 
    GL_KHR_texture_compression_astc_ldr, 
    GL_KHR_texture_compression_astc_sliced_3d, GL_MESA_framebuffer_flip_y, 
    GL_MESA_pack_invert, GL_MESA_shader_integer_functions, 
    GL_MESA_texture_signed_rgba, GL_NVX_gpu_memory_info, 
    GL_NV_alpha_to_coverage_dither_control, GL_NV_compute_shader_derivatives, 
    GL_NV_conditional_render, GL_NV_copy_image, GL_NV_depth_clamp, 
    GL_NV_packed_depth_stencil, GL_NV_shader_atomic_int64, 
    GL_NV_texture_barrier, GL_NV_vdpau_interop, GL_OES_EGL_image, GL_S3_s3tc
Memory info (GL_ATI_meminfo):
    VBO free memory - total: 2522 MB, largest block: 2522 MB
    VBO free aux. memory - total: 15856 MB, largest block: 15856 MB
    Texture free memory - total: 2522 MB, largest block: 2522 MB
    Texture free aux. memory - total: 15856 MB, largest block: 15856 MB
    Renderbuffer free memory - total: 2522 MB, largest block: 2522 MB
    Renderbuffer free aux. memory - total: 15856 MB, largest block: 15856 MB
Memory info (GL_NVX_gpu_memory_info):
    Dedicated video memory: 4096 MB
    Total available memory: 20077 MB
    Currently available dedicated video memory: 2522 MB
OpenGL compatibility profile vendor: AMD
OpenGL compatibility profile renderer: AMD Radeon RX 5500 XT (navi14, LLVM 15.0.7, DRM 3.52, 6.3.9-arch1-1)
OpenGL compatibility profile version: 4.6 (Compatibility Profile) Mesa 23.1.3
OpenGL compatibility profile shading language version: 4.60
OpenGL compatibility profile extensions:
    GL_AMD_conservative_depth, GL_AMD_depth_clamp_separate, 
    GL_AMD_draw_buffers_blend, GL_AMD_framebuffer_multisample_advanced, 
    GL_AMD_multi_draw_indirect, GL_AMD_performance_monitor, 
    GL_AMD_pinned_memory, GL_AMD_query_buffer_object, 
    GL_AMD_seamless_cubemap_per_texture, GL_AMD_shader_stencil_export, 
    GL_AMD_shader_trinary_minmax, GL_AMD_texture_texture4, 
    GL_AMD_vertex_shader_layer, GL_AMD_vertex_shader_viewport_index, 
    GL_ANGLE_texture_compression_dxt3, GL_ANGLE_texture_compression_dxt5, 
    GL_APPLE_packed_pixels, GL_ARB_ES2_compatibility, 
    GL_ARB_ES3_1_compatibility, GL_ARB_ES3_2_compatibility, 
    GL_ARB_ES3_compatibility, GL_ARB_arrays_of_arrays, GL_ARB_base_instance, 
    GL_ARB_bindless_texture, GL_ARB_blend_func_extended, 
    GL_ARB_buffer_storage, GL_ARB_clear_buffer_object, GL_ARB_clear_texture, 
    GL_ARB_clip_control, GL_ARB_color_buffer_float, GL_ARB_compatibility, 
    GL_ARB_compressed_texture_pixel_storage, GL_ARB_compute_shader, 
    GL_ARB_compute_variable_group_size, GL_ARB_conditional_render_inverted, 
    GL_ARB_conservative_depth, GL_ARB_copy_buffer, GL_ARB_copy_image, 
    GL_ARB_cull_distance, GL_ARB_debug_output, GL_ARB_depth_buffer_float, 
    GL_ARB_depth_clamp, GL_ARB_depth_texture, GL_ARB_derivative_control, 
    GL_ARB_direct_state_access, GL_ARB_draw_buffers, 
    GL_ARB_draw_buffers_blend, GL_ARB_draw_elements_base_vertex, 
    GL_ARB_draw_indirect, GL_ARB_draw_instanced, GL_ARB_enhanced_layouts, 
    GL_ARB_explicit_attrib_location, GL_ARB_explicit_uniform_location, 
    GL_ARB_fragment_coord_conventions, GL_ARB_fragment_layer_viewport, 
    GL_ARB_fragment_program, GL_ARB_fragment_program_shadow, 
    GL_ARB_fragment_shader, GL_ARB_framebuffer_no_attachments, 
    GL_ARB_framebuffer_object, GL_ARB_framebuffer_sRGB, 
    GL_ARB_get_program_binary, GL_ARB_get_texture_sub_image, GL_ARB_gl_spirv, 
    GL_ARB_gpu_shader5, GL_ARB_gpu_shader_fp64, GL_ARB_gpu_shader_int64, 
    GL_ARB_half_float_pixel, GL_ARB_half_float_vertex, 
    GL_ARB_indirect_parameters, GL_ARB_instanced_arrays, 
    GL_ARB_internalformat_query, GL_ARB_internalformat_query2, 
    GL_ARB_invalidate_subdata, GL_ARB_map_buffer_alignment, 
    GL_ARB_map_buffer_range, GL_ARB_multi_bind, GL_ARB_multi_draw_indirect, 
    GL_ARB_multisample, GL_ARB_multitexture, GL_ARB_occlusion_query, 
    GL_ARB_occlusion_query2, GL_ARB_parallel_shader_compile, 
    GL_ARB_pipeline_statistics_query, GL_ARB_pixel_buffer_object, 
    GL_ARB_point_parameters, GL_ARB_point_sprite, GL_ARB_polygon_offset_clamp, 
    GL_ARB_post_depth_coverage, GL_ARB_program_interface_query, 
    GL_ARB_provoking_vertex, GL_ARB_query_buffer_object, 
    GL_ARB_robust_buffer_access_behavior, GL_ARB_robustness, 
    GL_ARB_sample_shading, GL_ARB_sampler_objects, GL_ARB_seamless_cube_map, 
    GL_ARB_seamless_cubemap_per_texture, GL_ARB_separate_shader_objects, 
    GL_ARB_shader_atomic_counter_ops, GL_ARB_shader_atomic_counters, 
    GL_ARB_shader_ballot, GL_ARB_shader_bit_encoding, GL_ARB_shader_clock, 
    GL_ARB_shader_draw_parameters, GL_ARB_shader_group_vote, 
    GL_ARB_shader_image_load_store, GL_ARB_shader_image_size, 
    GL_ARB_shader_objects, GL_ARB_shader_precision, 
    GL_ARB_shader_stencil_export, GL_ARB_shader_storage_buffer_object, 
    GL_ARB_shader_subroutine, GL_ARB_shader_texture_image_samples, 
    GL_ARB_shader_texture_lod, GL_ARB_shader_viewport_layer_array, 
    GL_ARB_shading_language_100, GL_ARB_shading_language_420pack, 
    GL_ARB_shading_language_include, GL_ARB_shading_language_packing, 
    GL_ARB_shadow, GL_ARB_sparse_buffer, GL_ARB_sparse_texture, 
    GL_ARB_sparse_texture2, GL_ARB_sparse_texture_clamp, 
    GL_ARB_spirv_extensions, GL_ARB_stencil_texturing, GL_ARB_sync, 
    GL_ARB_tessellation_shader, GL_ARB_texture_barrier, 
    GL_ARB_texture_border_clamp, GL_ARB_texture_buffer_object, 
    GL_ARB_texture_buffer_object_rgb32, GL_ARB_texture_buffer_range, 
    GL_ARB_texture_compression, GL_ARB_texture_compression_bptc, 
    GL_ARB_texture_compression_rgtc, GL_ARB_texture_cube_map, 
    GL_ARB_texture_cube_map_array, GL_ARB_texture_env_add, 
    GL_ARB_texture_env_combine, GL_ARB_texture_env_crossbar, 
    GL_ARB_texture_env_dot3, GL_ARB_texture_filter_anisotropic, 
    GL_ARB_texture_float, GL_ARB_texture_gather, 
    GL_ARB_texture_mirror_clamp_to_edge, GL_ARB_texture_mirrored_repeat, 
    GL_ARB_texture_multisample, GL_ARB_texture_non_power_of_two, 
    GL_ARB_texture_query_levels, GL_ARB_texture_query_lod, 
    GL_ARB_texture_rectangle, GL_ARB_texture_rg, GL_ARB_texture_rgb10_a2ui, 
    GL_ARB_texture_stencil8, GL_ARB_texture_storage, 
    GL_ARB_texture_storage_multisample, GL_ARB_texture_swizzle, 
    GL_ARB_texture_view, GL_ARB_timer_query, GL_ARB_transform_feedback2, 
    GL_ARB_transform_feedback3, GL_ARB_transform_feedback_instanced, 
    GL_ARB_transform_feedback_overflow_query, GL_ARB_transpose_matrix, 
    GL_ARB_uniform_buffer_object, GL_ARB_vertex_array_bgra, 
    GL_ARB_vertex_array_object, GL_ARB_vertex_attrib_64bit, 
    GL_ARB_vertex_attrib_binding, GL_ARB_vertex_buffer_object, 
    GL_ARB_vertex_program, GL_ARB_vertex_shader, 
    GL_ARB_vertex_type_10f_11f_11f_rev, GL_ARB_vertex_type_2_10_10_10_rev, 
    GL_ARB_viewport_array, GL_ARB_window_pos, GL_ATI_blend_equation_separate, 
    GL_ATI_draw_buffers, GL_ATI_fragment_shader, GL_ATI_meminfo, 
    GL_ATI_separate_stencil, GL_ATI_texture_compression_3dc, 
    GL_ATI_texture_env_combine3, GL_ATI_texture_float, 
    GL_ATI_texture_mirror_once, GL_EXT_EGL_image_storage, GL_EXT_EGL_sync, 
    GL_EXT_abgr, GL_EXT_bgra, GL_EXT_blend_color, 
    GL_EXT_blend_equation_separate, GL_EXT_blend_func_separate, 
    GL_EXT_blend_minmax, GL_EXT_blend_subtract, GL_EXT_compiled_vertex_array, 
    GL_EXT_copy_texture, GL_EXT_debug_label, 
    GL_EXT_demote_to_helper_invocation, GL_EXT_depth_bounds_test, 
    GL_EXT_direct_state_access, GL_EXT_draw_buffers2, GL_EXT_draw_instanced, 
    GL_EXT_draw_range_elements, GL_EXT_fog_coord, GL_EXT_framebuffer_blit, 
    GL_EXT_framebuffer_multisample, GL_EXT_framebuffer_multisample_blit_scaled, 
    GL_EXT_framebuffer_object, GL_EXT_framebuffer_sRGB, 
    GL_EXT_gpu_program_parameters, GL_EXT_gpu_shader4, GL_EXT_memory_object, 
    GL_EXT_memory_object_fd, GL_EXT_multi_draw_arrays, 
    GL_EXT_packed_depth_stencil, GL_EXT_packed_float, GL_EXT_packed_pixels, 
    GL_EXT_pixel_buffer_object, GL_EXT_point_parameters, 
    GL_EXT_polygon_offset_clamp, GL_EXT_provoking_vertex, 
    GL_EXT_rescale_normal, GL_EXT_secondary_color, GL_EXT_semaphore, 
    GL_EXT_semaphore_fd, GL_EXT_separate_specular_color, 
    GL_EXT_shader_image_load_formatted, GL_EXT_shader_image_load_store, 
    GL_EXT_shader_integer_mix, GL_EXT_shader_samples_identical, 
    GL_EXT_shadow_funcs, GL_EXT_stencil_two_side, GL_EXT_stencil_wrap, 
    GL_EXT_subtexture, GL_EXT_texture, GL_EXT_texture3D, 
    GL_EXT_texture_array, GL_EXT_texture_buffer_object, 
    GL_EXT_texture_compression_dxt1, GL_EXT_texture_compression_latc, 
    GL_EXT_texture_compression_rgtc, GL_EXT_texture_compression_s3tc, 
    GL_EXT_texture_cube_map, GL_EXT_texture_edge_clamp, 
    GL_EXT_texture_env_add, GL_EXT_texture_env_combine, 
    GL_EXT_texture_env_dot3, GL_EXT_texture_filter_anisotropic, 
    GL_EXT_texture_integer, GL_EXT_texture_lod_bias, 
    GL_EXT_texture_mirror_clamp, GL_EXT_texture_object, 
    GL_EXT_texture_rectangle, GL_EXT_texture_sRGB, GL_EXT_texture_sRGB_R8, 
    GL_EXT_texture_sRGB_RG8, GL_EXT_texture_sRGB_decode, 
    GL_EXT_texture_shadow_lod, GL_EXT_texture_shared_exponent, 
    GL_EXT_texture_snorm, GL_EXT_texture_swizzle, GL_EXT_timer_query, 
    GL_EXT_transform_feedback, GL_EXT_vertex_array, GL_EXT_vertex_array_bgra, 
    GL_EXT_vertex_attrib_64bit, GL_EXT_window_rectangles, 
    GL_IBM_multimode_draw_arrays, GL_IBM_rasterpos_clip, 
    GL_IBM_texture_mirrored_repeat, GL_INGR_blend_func_separate, 
    GL_INTEL_blackhole_render, GL_KHR_blend_equation_advanced, 
    GL_KHR_context_flush_control, GL_KHR_debug, GL_KHR_no_error, 
    GL_KHR_parallel_shader_compile, GL_KHR_robust_buffer_access_behavior, 
    GL_KHR_robustness, GL_KHR_texture_compression_astc_ldr, 
    GL_KHR_texture_compression_astc_sliced_3d, GL_MESA_framebuffer_flip_y, 
    GL_MESA_pack_invert, GL_MESA_shader_integer_functions, 
    GL_MESA_texture_signed_rgba, GL_MESA_window_pos, GL_NVX_gpu_memory_info, 
    GL_NV_ES1_1_compatibility, GL_NV_alpha_to_coverage_dither_control, 
    GL_NV_blend_square, GL_NV_compute_shader_derivatives, 
    GL_NV_conditional_render, GL_NV_copy_depth_to_color, GL_NV_copy_image, 
    GL_NV_depth_clamp, GL_NV_fog_distance, GL_NV_half_float, 
    GL_NV_light_max_exponent, GL_NV_packed_depth_stencil, 
    GL_NV_primitive_restart, GL_NV_shader_atomic_int64, 
    GL_NV_texgen_reflection, GL_NV_texture_barrier, 
    GL_NV_texture_env_combine4, GL_NV_texture_rectangle, GL_NV_vdpau_interop, 
    GL_OES_EGL_image, GL_OES_read_format, GL_S3_s3tc, 
    GL_SGIS_generate_mipmap, GL_SGIS_texture_border_clamp, 
    GL_SGIS_texture_edge_clamp, GL_SGIS_texture_lod, GL_SUN_multi_draw_arrays
Memory info (GL_ATI_meminfo):
    VBO free memory - total: 2522 MB, largest block: 2522 MB
    VBO free aux. memory - total: 15856 MB, largest block: 15856 MB
    Texture free memory - total: 2522 MB, largest block: 2522 MB
    Texture free aux. memory - total: 15856 MB, largest block: 15856 MB
    Renderbuffer free memory - total: 2522 MB, largest block: 2522 MB
    Renderbuffer free aux. memory - total: 15856 MB, largest block: 15856 MB
Memory info (GL_NVX_gpu_memory_info):
    Dedicated video memory: 4096 MB
    Total available memory: 20077 MB
    Currently available dedicated video memory: 2522 MB
OpenGL ES profile vendor: AMD
OpenGL ES profile renderer: AMD Radeon RX 5500 XT (navi14, LLVM 15.0.7, DRM 3.52, 6.3.9-arch1-1)
OpenGL ES profile version: OpenGL ES 3.2 Mesa 23.1.3
OpenGL ES profile shading language version: OpenGL ES GLSL ES 3.20
OpenGL ES profile extensions:
    GL_AMD_framebuffer_multisample_advanced, GL_AMD_performance_monitor, 
    GL_ANDROID_extension_pack_es31a, GL_ANGLE_pack_reverse_row_order, 
    GL_ANGLE_texture_compression_dxt3, GL_ANGLE_texture_compression_dxt5, 
    GL_APPLE_texture_max_level, GL_EXT_EGL_image_storage, 
    GL_EXT_base_instance, GL_EXT_blend_func_extended, GL_EXT_blend_minmax, 
    GL_EXT_buffer_storage, GL_EXT_clear_texture, GL_EXT_clip_control, 
    GL_EXT_clip_cull_distance, GL_EXT_color_buffer_float, 
    GL_EXT_color_buffer_half_float, GL_EXT_compressed_ETC1_RGB8_sub_texture, 
    GL_EXT_copy_image, GL_EXT_debug_label, GL_EXT_demote_to_helper_invocation, 
    GL_EXT_depth_clamp, GL_EXT_discard_framebuffer, 
    GL_EXT_disjoint_timer_query, GL_EXT_draw_buffers, 
    GL_EXT_draw_buffers_indexed, GL_EXT_draw_elements_base_vertex, 
    GL_EXT_draw_instanced, GL_EXT_float_blend, GL_EXT_frag_depth, 
    GL_EXT_geometry_point_size, GL_EXT_geometry_shader, GL_EXT_gpu_shader5, 
    GL_EXT_instanced_arrays, GL_EXT_map_buffer_range, GL_EXT_memory_object, 
    GL_EXT_memory_object_fd, GL_EXT_multi_draw_arrays, 
    GL_EXT_occlusion_query_boolean, GL_EXT_polygon_offset_clamp, 
    GL_EXT_primitive_bounding_box, GL_EXT_read_format_bgra, 
    GL_EXT_render_snorm, GL_EXT_robustness, GL_EXT_sRGB_write_control, 
    GL_EXT_semaphore, GL_EXT_semaphore_fd, GL_EXT_separate_shader_objects, 
    GL_EXT_shader_group_vote, GL_EXT_shader_implicit_conversions, 
    GL_EXT_shader_integer_mix, GL_EXT_shader_io_blocks, 
    GL_EXT_shader_samples_identical, GL_EXT_tessellation_point_size, 
    GL_EXT_tessellation_shader, GL_EXT_texture_border_clamp, 
    GL_EXT_texture_buffer, GL_EXT_texture_compression_bptc, 
    GL_EXT_texture_compression_dxt1, GL_EXT_texture_compression_rgtc, 
    GL_EXT_texture_compression_s3tc, GL_EXT_texture_compression_s3tc_srgb, 
    GL_EXT_texture_cube_map_array, GL_EXT_texture_filter_anisotropic, 
    GL_EXT_texture_format_BGRA8888, GL_EXT_texture_mirror_clamp_to_edge, 
    GL_EXT_texture_norm16, GL_EXT_texture_query_lod, GL_EXT_texture_rg, 
    GL_EXT_texture_sRGB_R8, GL_EXT_texture_sRGB_RG8, 
    GL_EXT_texture_sRGB_decode, GL_EXT_texture_shadow_lod, 
    GL_EXT_texture_type_2_10_10_10_REV, GL_EXT_texture_view, 
    GL_EXT_unpack_subimage, GL_EXT_window_rectangles, 
    GL_INTEL_blackhole_render, GL_KHR_blend_equation_advanced, 
    GL_KHR_context_flush_control, GL_KHR_debug, GL_KHR_no_error, 
    GL_KHR_parallel_shader_compile, GL_KHR_robust_buffer_access_behavior, 
    GL_KHR_robustness, GL_KHR_texture_compression_astc_ldr, 
    GL_KHR_texture_compression_astc_sliced_3d, GL_MESA_bgra, 
    GL_MESA_framebuffer_flip_y, GL_MESA_shader_integer_functions, 
    GL_NV_alpha_to_coverage_dither_control, GL_NV_compute_shader_derivatives, 
    GL_NV_conditional_render, GL_NV_draw_buffers, GL_NV_fbo_color_attachments, 
    GL_NV_generate_mipmap_sRGB, GL_NV_image_formats, GL_NV_pack_subimage, 
    GL_NV_pixel_buffer_object, GL_NV_read_buffer, GL_NV_read_depth, 
    GL_NV_read_depth_stencil, GL_NV_read_stencil, 
    GL_NV_shader_noperspective_interpolation, GL_OES_EGL_image, 
    GL_OES_EGL_image_external, GL_OES_EGL_image_external_essl3, 
    GL_OES_EGL_sync, GL_OES_compressed_ETC1_RGB8_texture, GL_OES_copy_image, 
    GL_OES_depth24, GL_OES_depth_texture, GL_OES_depth_texture_cube_map, 
    GL_OES_draw_buffers_indexed, GL_OES_draw_elements_base_vertex, 
    GL_OES_element_index_uint, GL_OES_fbo_render_mipmap, 
    GL_OES_geometry_point_size, GL_OES_geometry_shader, 
    GL_OES_get_program_binary, GL_OES_gpu_shader5, GL_OES_mapbuffer, 
    GL_OES_packed_depth_stencil, GL_OES_primitive_bounding_box, 
    GL_OES_required_internalformat, GL_OES_rgb8_rgba8, GL_OES_sample_shading, 
    GL_OES_sample_variables, GL_OES_shader_image_atomic, 
    GL_OES_shader_io_blocks, GL_OES_shader_multisample_interpolation, 
    GL_OES_standard_derivatives, GL_OES_stencil8, GL_OES_surfaceless_context, 
    GL_OES_tessellation_point_size, GL_OES_tessellation_shader, 
    GL_OES_texture_3D, GL_OES_texture_border_clamp, GL_OES_texture_buffer, 
    GL_OES_texture_cube_map_array, GL_OES_texture_float, 
    GL_OES_texture_float_linear, GL_OES_texture_half_float, 
    GL_OES_texture_half_float_linear, GL_OES_texture_npot, 
    GL_OES_texture_stencil8, GL_OES_texture_storage_multisample_2d_array, 
    GL_OES_texture_view, GL_OES_vertex_array_object, GL_OES_vertex_half_float, 
    GL_OES_viewport_array
Configurations:
     bf lv colorbuffer dp st  ms    vis   cav bi  renderable  supported
  id sz  l  r  g  b  a th cl ns b    id   eat nd gl es es2 vg surfaces 
---------------------------------------------------------------------
0x01 32  0 10 10 10  2  0  0  0 0 0x00--      a  y  y  y     pb
0x02 32  0 10 10 10  2 16  0  0 0 0x00--      a  y  y  y     pb
0x03 32  0 10 10 10  2 24  0  0 0 0x00--      a  y  y  y     pb
0x04 32  0 10 10 10  2 24  8  0 0 0x00--      a  y  y  y     pb
0x05 32  0 10 10 10  2  0  0  2 1 0x00--      a  y  y  y     pb
0x06 32  0 10 10 10  2  0  0  4 1 0x00--      a  y  y  y     pb
0x07 32  0 10 10 10  2  0  0  8 1 0x00--      a  y  y  y     pb
0x08 32  0 10 10 10  2 16  0  2 1 0x00--      a  y  y  y     pb
0x09 32  0 10 10 10  2 16  0  4 1 0x00--      a  y  y  y     pb
0x0a 32  0 10 10 10  2 16  0  8 1 0x00--      a  y  y  y     pb
0x0b 32  0 10 10 10  2 24  0  2 1 0x00--      a  y  y  y     pb
0x0c 32  0 10 10 10  2 24  0  4 1 0x00--      a  y  y  y     pb
0x0d 32  0 10 10 10  2 24  0  8 1 0x00--      a  y  y  y     pb
0x0e 32  0 10 10 10  2 24  8  2 1 0x00--      a  y  y  y     pb
0x0f 32  0 10 10 10  2 24  8  4 1 0x00--      a  y  y  y     pb
0x10 32  0 10 10 10  2 24  8  8 1 0x00--      a  y  y  y     pb
0x11 30  0 10 10 10  0  0  0  0 0 0x00--      y  y  y  y     pb
0x12 30  0 10 10 10  0 16  0  0 0 0x00--      y  y  y  y     pb
0x13 30  0 10 10 10  0 24  0  0 0 0x00--      y  y  y  y     pb
0x14 30  0 10 10 10  0 24  8  0 0 0x00--      y  y  y  y     pb
0x15 30  0 10 10 10  0  0  0  2 1 0x00--      y  y  y  y     pb
0x16 30  0 10 10 10  0  0  0  4 1 0x00--      y  y  y  y     pb
0x17 30  0 10 10 10  0  0  0  8 1 0x00--      y  y  y  y     pb
0x18 30  0 10 10 10  0 16  0  2 1 0x00--      y  y  y  y     pb
0x19 30  0 10 10 10  0 16  0  4 1 0x00--      y  y  y  y     pb
0x1a 30  0 10 10 10  0 16  0  8 1 0x00--      y  y  y  y     pb
0x1b 30  0 10 10 10  0 24  0  2 1 0x00--      y  y  y  y     pb
0x1c 30  0 10 10 10  0 24  0  4 1 0x00--      y  y  y  y     pb
0x1d 30  0 10 10 10  0 24  0  8 1 0x00--      y  y  y  y     pb
0x1e 30  0 10 10 10  0 24  8  2 1 0x00--      y  y  y  y     pb
0x1f 30  0 10 10 10  0 24  8  4 1 0x00--      y  y  y  y     pb
0x20 30  0 10 10 10  0 24  8  8 1 0x00--      y  y  y  y     pb
0x21 32  0  8  8  8  8  0  0  0 0 0x00--      a  y  y  y     pb
0x22 32  0  8  8  8  8 16  0  0 0 0x00--      a  y  y  y     pb
0x23 32  0  8  8  8  8 24  0  0 0 0x00--      a  y  y  y     pb
0x24 32  0  8  8  8  8 24  8  0 0 0x00--      a  y  y  y     pb
0x25 32  0  8  8  8  8  0  0  2 1 0x00--      a  y  y  y     pb
0x26 32  0  8  8  8  8  0  0  4 1 0x00--      a  y  y  y     pb
0x27 32  0  8  8  8  8  0  0  8 1 0x00--      a  y  y  y     pb
0x28 32  0  8  8  8  8 16  0  2 1 0x00--      a  y  y  y     pb
0x29 32  0  8  8  8  8 16  0  4 1 0x00--      a  y  y  y     pb
0x2a 32  0  8  8  8  8 16  0  8 1 0x00--      a  y  y  y     pb
0x2b 32  0  8  8  8  8 24  0  2 1 0x00--      a  y  y  y     pb
0x2c 32  0  8  8  8  8 24  0  4 1 0x00--      a  y  y  y     pb
0x2d 32  0  8  8  8  8 24  0  8 1 0x00--      a  y  y  y     pb
0x2e 32  0  8  8  8  8 24  8  2 1 0x00--      a  y  y  y     pb
0x2f 32  0  8  8  8  8 24  8  4 1 0x00--      a  y  y  y     pb
0x30 32  0  8  8  8  8 24  8  8 1 0x00--      a  y  y  y     pb
0x31 24  0  8  8  8  0  0  0  0 0 0x00--      y  y  y  y     pb
0x32 24  0  8  8  8  0 16  0  0 0 0x00--      y  y  y  y     pb
0x33 24  0  8  8  8  0 24  0  0 0 0x00--      y  y  y  y     pb
0x34 24  0  8  8  8  0 24  8  0 0 0x00--      y  y  y  y     pb
0x35 24  0  8  8  8  0  0  0  2 1 0x00--      y  y  y  y     pb
0x36 24  0  8  8  8  0  0  0  4 1 0x00--      y  y  y  y     pb
0x37 24  0  8  8  8  0  0  0  8 1 0x00--      y  y  y  y     pb
0x38 24  0  8  8  8  0 16  0  2 1 0x00--      y  y  y  y     pb
0x39 24  0  8  8  8  0 16  0  4 1 0x00--      y  y  y  y     pb
0x3a 24  0  8  8  8  0 16  0  8 1 0x00--      y  y  y  y     pb
0x3b 24  0  8  8  8  0 24  0  2 1 0x00--      y  y  y  y     pb
0x3c 24  0  8  8  8  0 24  0  4 1 0x00--      y  y  y  y     pb
0x3d 24  0  8  8  8  0 24  0  8 1 0x00--      y  y  y  y     pb
0x3e 24  0  8  8  8  0 24  8  2 1 0x00--      y  y  y  y     pb
0x3f 24  0  8  8  8  0 24  8  4 1 0x00--      y  y  y  y     pb
0x40 24  0  8  8  8  0 24  8  8 1 0x00--      y  y  y  y     pb
0x41 16  0  5  6  5  0  0  0  0 0 0x00--      y  y  y  y     pb
0x42 16  0  5  6  5  0 16  0  0 0 0x00--      y  y  y  y     pb
0x43 16  0  5  6  5  0 24  0  0 0 0x00--      y  y  y  y     pb
0x44 16  0  5  6  5  0 24  8  0 0 0x00--      y  y  y  y     pb
0x45 16  0  5  6  5  0  0  0  2 1 0x00--      y  y  y  y     pb
0x46 16  0  5  6  5  0  0  0  4 1 0x00--      y  y  y  y     pb
0x47 16  0  5  6  5  0  0  0  8 1 0x00--      y  y  y  y     pb
0x48 16  0  5  6  5  0 16  0  2 1 0x00--      y  y  y  y     pb
0x49 16  0  5  6  5  0 16  0  4 1 0x00--      y  y  y  y     pb
0x4a 16  0  5  6  5  0 16  0  8 1 0x00--      y  y  y  y     pb
0x4b 16  0  5  6  5  0 24  0  2 1 0x00--      y  y  y  y     pb
0x4c 16  0  5  6  5  0 24  0  4 1 0x00--      y  y  y  y     pb
0x4d 16  0  5  6  5  0 24  0  8 1 0x00--      y  y  y  y     pb
0x4e 16  0  5  6  5  0 24  8  2 1 0x00--      y  y  y  y     pb
0x4f 16  0  5  6  5  0 24  8  4 1 0x00--      y  y  y  y     pb
0x50 16  0  5  6  5  0 24  8  8 1 0x00--      y  y  y  y     pb
0x51 64  0 16 16 16 16  0  0  0 0 0x00--      a  y  y  y     pb
0x52 64  0 16 16 16 16 16  0  0 0 0x00--      a  y  y  y     pb
0x53 64  0 16 16 16 16 24  0  0 0 0x00--      a  y  y  y     pb
0x54 64  0 16 16 16 16 24  8  0 0 0x00--      a  y  y  y     pb
0x55 64  0 16 16 16 16  0  0  2 1 0x00--      a  y  y  y     pb
0x56 64  0 16 16 16 16  0  0  4 1 0x00--      a  y  y  y     pb
0x57 64  0 16 16 16 16  0  0  8 1 0x00--      a  y  y  y     pb
0x58 64  0 16 16 16 16 16  0  2 1 0x00--      a  y  y  y     pb
0x59 64  0 16 16 16 16 16  0  4 1 0x00--      a  y  y  y     pb
0x5a 64  0 16 16 16 16 16  0  8 1 0x00--      a  y  y  y     pb
0x5b 64  0 16 16 16 16 24  0  2 1 0x00--      a  y  y  y     pb
0x5c 64  0 16 16 16 16 24  0  4 1 0x00--      a  y  y  y     pb
0x5d 64  0 16 16 16 16 24  0  8 1 0x00--      a  y  y  y     pb
0x5e 64  0 16 16 16 16 24  8  2 1 0x00--      a  y  y  y     pb
0x5f 64  0 16 16 16 16 24  8  4 1 0x00--      a  y  y  y     pb
0x60 64  0 16 16 16 16 24  8  8 1 0x00--      a  y  y  y     pb
0x61 48  0 16 16 16  0  0  0  0 0 0x00--      y  y  y  y     pb
0x62 48  0 16 16 16  0 16  0  0 0 0x00--      y  y  y  y     pb
0x63 48  0 16 16 16  0 24  0  0 0 0x00--      y  y  y  y     pb
0x64 48  0 16 16 16  0 24  8  0 0 0x00--      y  y  y  y     pb
0x65 48  0 16 16 16  0  0  0  2 1 0x00--      y  y  y  y     pb
0x66 48  0 16 16 16  0  0  0  4 1 0x00--      y  y  y  y     pb
0x67 48  0 16 16 16  0  0  0  8 1 0x00--      y  y  y  y     pb
0x68 48  0 16 16 16  0 16  0  2 1 0x00--      y  y  y  y     pb
0x69 48  0 16 16 16  0 16  0  4 1 0x00--      y  y  y  y     pb
0x6a 48  0 16 16 16  0 16  0  8 1 0x00--      y  y  y  y     pb
0x6b 48  0 16 16 16  0 24  0  2 1 0x00--      y  y  y  y     pb
0x6c 48  0 16 16 16  0 24  0  4 1 0x00--      y  y  y  y     pb
0x6d 48  0 16 16 16  0 24  0  8 1 0x00--      y  y  y  y     pb
0x6e 48  0 16 16 16  0 24  8  2 1 0x00--      y  y  y  y     pb
0x6f 48  0 16 16 16  0 24  8  4 1 0x00--      y  y  y  y     pb
0x70 48  0 16 16 16  0 24  8  8 1 0x00--      y  y  y  y     pb

Device #2:

EGL device extensions string:
    EGL_EXT_device_drm_render_node, EGL_MESA_device_software
Platform Device platform:
EGL API version: 1.5
EGL vendor string: Mesa Project
EGL version string: 1.5
EGL client APIs: OpenGL OpenGL_ES 
EGL driver name: swrast
EGL extensions string:
    EGL_EXT_create_context_robustness, EGL_EXT_pixel_format_float, 
    EGL_KHR_cl_event2, EGL_KHR_config_attribs, EGL_KHR_context_flush_control, 
    EGL_KHR_create_context, EGL_KHR_create_context_no_error, 
    EGL_KHR_fence_sync, EGL_KHR_get_all_proc_addresses, EGL_KHR_gl_colorspace, 
    EGL_KHR_gl_renderbuffer_image, EGL_KHR_gl_texture_2D_image, 
    EGL_KHR_gl_texture_3D_image, EGL_KHR_gl_texture_cubemap_image, 
    EGL_KHR_image_base, EGL_KHR_no_config_context, EGL_KHR_reusable_sync, 
    EGL_KHR_surfaceless_context, EGL_KHR_wait_sync, 
    EGL_MESA_configless_context, EGL_MESA_drm_image, EGL_MESA_query_driver
OpenGL core profile vendor: Mesa
OpenGL core profile renderer: llvmpipe (LLVM 15.0.7, 256 bits)
OpenGL core profile version: 4.5 (Core Profile) Mesa 23.1.3
OpenGL core profile shading language version: 4.50
OpenGL core profile extensions:
    GL_3DFX_texture_compression_FXT1, GL_AMD_conservative_depth, 
    GL_AMD_draw_buffers_blend, GL_AMD_gpu_shader_int64, 
    GL_AMD_multi_draw_indirect, GL_AMD_pinned_memory, 
    GL_AMD_query_buffer_object, GL_AMD_seamless_cubemap_per_texture, 
    GL_AMD_shader_stencil_export, GL_AMD_shader_trinary_minmax, 
    GL_AMD_texture_texture4, GL_AMD_vertex_shader_layer, 
    GL_AMD_vertex_shader_viewport_index, GL_ANGLE_texture_compression_dxt3, 
    GL_ANGLE_texture_compression_dxt5, GL_ARB_ES2_compatibility, 
    GL_ARB_ES3_1_compatibility, GL_ARB_ES3_2_compatibility, 
    GL_ARB_ES3_compatibility, GL_ARB_arrays_of_arrays, GL_ARB_base_instance, 
    GL_ARB_blend_func_extended, GL_ARB_buffer_storage, 
    GL_ARB_clear_buffer_object, GL_ARB_clear_texture, GL_ARB_clip_control, 
    GL_ARB_compressed_texture_pixel_storage, GL_ARB_compute_shader, 
    GL_ARB_conditional_render_inverted, GL_ARB_conservative_depth, 
    GL_ARB_copy_buffer, GL_ARB_copy_image, GL_ARB_cull_distance, 
    GL_ARB_debug_output, GL_ARB_depth_buffer_float, GL_ARB_depth_clamp, 
    GL_ARB_derivative_control, GL_ARB_direct_state_access, 
    GL_ARB_draw_buffers, GL_ARB_draw_buffers_blend, 
    GL_ARB_draw_elements_base_vertex, GL_ARB_draw_indirect, 
    GL_ARB_draw_instanced, GL_ARB_enhanced_layouts, 
    GL_ARB_explicit_attrib_location, GL_ARB_explicit_uniform_location, 
    GL_ARB_fragment_coord_conventions, GL_ARB_fragment_layer_viewport, 
    GL_ARB_fragment_shader, GL_ARB_framebuffer_no_attachments, 
    GL_ARB_framebuffer_object, GL_ARB_framebuffer_sRGB, 
    GL_ARB_get_program_binary, GL_ARB_get_texture_sub_image, GL_ARB_gl_spirv, 
    GL_ARB_gpu_shader5, GL_ARB_gpu_shader_fp64, GL_ARB_gpu_shader_int64, 
    GL_ARB_half_float_pixel, GL_ARB_half_float_vertex, 
    GL_ARB_indirect_parameters, GL_ARB_instanced_arrays, 
    GL_ARB_internalformat_query, GL_ARB_internalformat_query2, 
    GL_ARB_invalidate_subdata, GL_ARB_map_buffer_alignment, 
    GL_ARB_map_buffer_range, GL_ARB_multi_bind, GL_ARB_multi_draw_indirect, 
    GL_ARB_occlusion_query2, GL_ARB_parallel_shader_compile, 
    GL_ARB_pipeline_statistics_query, GL_ARB_pixel_buffer_object, 
    GL_ARB_point_sprite, GL_ARB_polygon_offset_clamp, 
    GL_ARB_post_depth_coverage, GL_ARB_program_interface_query, 
    GL_ARB_provoking_vertex, GL_ARB_query_buffer_object, 
    GL_ARB_robust_buffer_access_behavior, GL_ARB_robustness, 
    GL_ARB_sample_shading, GL_ARB_sampler_objects, GL_ARB_seamless_cube_map, 
    GL_ARB_seamless_cubemap_per_texture, GL_ARB_separate_shader_objects, 
    GL_ARB_shader_atomic_counter_ops, GL_ARB_shader_atomic_counters, 
    GL_ARB_shader_ballot, GL_ARB_shader_bit_encoding, GL_ARB_shader_clock, 
    GL_ARB_shader_draw_parameters, GL_ARB_shader_group_vote, 
    GL_ARB_shader_image_load_store, GL_ARB_shader_image_size, 
    GL_ARB_shader_objects, GL_ARB_shader_precision, 
    GL_ARB_shader_stencil_export, GL_ARB_shader_storage_buffer_object, 
    GL_ARB_shader_subroutine, GL_ARB_shader_texture_image_samples, 
    GL_ARB_shader_texture_lod, GL_ARB_shader_viewport_layer_array, 
    GL_ARB_shading_language_420pack, GL_ARB_shading_language_include, 
    GL_ARB_shading_language_packing, GL_ARB_spirv_extensions, 
    GL_ARB_stencil_texturing, GL_ARB_sync, GL_ARB_tessellation_shader, 
    GL_ARB_texture_barrier, GL_ARB_texture_buffer_object, 
    GL_ARB_texture_buffer_object_rgb32, GL_ARB_texture_buffer_range, 
    GL_ARB_texture_compression_bptc, GL_ARB_texture_compression_rgtc, 
    GL_ARB_texture_cube_map_array, GL_ARB_texture_filter_anisotropic, 
    GL_ARB_texture_filter_minmax, GL_ARB_texture_float, GL_ARB_texture_gather, 
    GL_ARB_texture_mirror_clamp_to_edge, GL_ARB_texture_multisample, 
    GL_ARB_texture_non_power_of_two, GL_ARB_texture_query_levels, 
    GL_ARB_texture_query_lod, GL_ARB_texture_rectangle, GL_ARB_texture_rg, 
    GL_ARB_texture_rgb10_a2ui, GL_ARB_texture_stencil8, 
    GL_ARB_texture_storage, GL_ARB_texture_storage_multisample, 
    GL_ARB_texture_swizzle, GL_ARB_texture_view, GL_ARB_timer_query, 
    GL_ARB_transform_feedback2, GL_ARB_transform_feedback3, 
    GL_ARB_transform_feedback_instanced, 
    GL_ARB_transform_feedback_overflow_query, GL_ARB_uniform_buffer_object, 
    GL_ARB_vertex_array_bgra, GL_ARB_vertex_array_object, 
    GL_ARB_vertex_attrib_64bit, GL_ARB_vertex_attrib_binding, 
    GL_ARB_vertex_buffer_object, GL_ARB_vertex_shader, 
    GL_ARB_vertex_type_10f_11f_11f_rev, GL_ARB_vertex_type_2_10_10_10_rev, 
    GL_ARB_viewport_array, GL_ARM_shader_framebuffer_fetch_depth_stencil, 
    GL_ATI_blend_equation_separate, GL_ATI_meminfo, GL_ATI_texture_float, 
    GL_ATI_texture_mirror_once, GL_EXT_EGL_image_storage, GL_EXT_EGL_sync, 
    GL_EXT_abgr, GL_EXT_blend_equation_separate, GL_EXT_debug_label, 
    GL_EXT_draw_buffers2, GL_EXT_draw_instanced, GL_EXT_framebuffer_blit, 
    GL_EXT_framebuffer_multisample, GL_EXT_framebuffer_multisample_blit_scaled, 
    GL_EXT_framebuffer_object, GL_EXT_framebuffer_sRGB, GL_EXT_memory_object, 
    GL_EXT_memory_object_fd, GL_EXT_packed_depth_stencil, GL_EXT_packed_float, 
    GL_EXT_pixel_buffer_object, GL_EXT_polygon_offset_clamp, 
    GL_EXT_provoking_vertex, GL_EXT_shader_framebuffer_fetch, 
    GL_EXT_shader_framebuffer_fetch_non_coherent, GL_EXT_shader_integer_mix, 
    GL_EXT_texture_array, GL_EXT_texture_compression_dxt1, 
    GL_EXT_texture_compression_rgtc, GL_EXT_texture_compression_s3tc, 
    GL_EXT_texture_filter_anisotropic, GL_EXT_texture_filter_minmax, 
    GL_EXT_texture_integer, GL_EXT_texture_mirror_clamp, GL_EXT_texture_sRGB, 
    GL_EXT_texture_sRGB_R8, GL_EXT_texture_sRGB_RG8, 
    GL_EXT_texture_sRGB_decode, GL_EXT_texture_shadow_lod, 
    GL_EXT_texture_shared_exponent, GL_EXT_texture_snorm, 
    GL_EXT_texture_swizzle, GL_EXT_timer_query, GL_EXT_transform_feedback, 
    GL_EXT_vertex_array_bgra, GL_EXT_vertex_attrib_64bit, 
    GL_IBM_multimode_draw_arrays, GL_INTEL_shader_atomic_float_minmax, 
    GL_KHR_blend_equation_advanced, GL_KHR_blend_equation_advanced_coherent, 
    GL_KHR_context_flush_control, GL_KHR_debug, GL_KHR_no_error, 
    GL_KHR_parallel_shader_compile, GL_KHR_robust_buffer_access_behavior, 
    GL_KHR_robustness, GL_KHR_texture_compression_astc_ldr, 
    GL_KHR_texture_compression_astc_sliced_3d, GL_MESA_framebuffer_flip_y, 
    GL_MESA_pack_invert, GL_MESA_shader_integer_functions, 
    GL_MESA_texture_signed_rgba, GL_MESA_ycbcr_texture, 
    GL_NVX_gpu_memory_info, GL_NV_conditional_render, GL_NV_copy_image, 
    GL_NV_depth_clamp, GL_NV_packed_depth_stencil, GL_NV_shader_atomic_float, 
    GL_NV_texture_barrier, GL_OES_EGL_image, GL_S3_s3tc
Memory info (GL_ATI_meminfo):
    VBO free memory - total: 31 MB, largest block: 31 MB
    VBO free aux. memory - total: 29234 MB, largest block: 29234 MB
    Texture free memory - total: 31 MB, largest block: 31 MB
    Texture free aux. memory - total: 29234 MB, largest block: 29234 MB
    Renderbuffer free memory - total: 31 MB, largest block: 31 MB
    Renderbuffer free aux. memory - total: 29234 MB, largest block: 29234 MB
Memory info (GL_NVX_gpu_memory_info):
    Dedicated video memory: 4292931918 MB
    Total available memory: 4292963882 MB
    Currently available dedicated video memory: 31 MB
OpenGL compatibility profile vendor: Mesa
OpenGL compatibility profile renderer: llvmpipe (LLVM 15.0.7, 256 bits)
OpenGL compatibility profile version: 4.5 (Compatibility Profile) Mesa 23.1.3
OpenGL compatibility profile shading language version: 4.50
OpenGL compatibility profile extensions:
    GL_3DFX_texture_compression_FXT1, GL_AMD_conservative_depth, 
    GL_AMD_draw_buffers_blend, GL_AMD_multi_draw_indirect, 
    GL_AMD_pinned_memory, GL_AMD_query_buffer_object, 
    GL_AMD_seamless_cubemap_per_texture, GL_AMD_shader_stencil_export, 
    GL_AMD_shader_trinary_minmax, GL_AMD_texture_texture4, 
    GL_AMD_vertex_shader_layer, GL_AMD_vertex_shader_viewport_index, 
    GL_ANGLE_texture_compression_dxt3, GL_ANGLE_texture_compression_dxt5, 
    GL_APPLE_packed_pixels, GL_ARB_ES2_compatibility, 
    GL_ARB_ES3_1_compatibility, GL_ARB_ES3_2_compatibility, 
    GL_ARB_ES3_compatibility, GL_ARB_arrays_of_arrays, GL_ARB_base_instance, 
    GL_ARB_blend_func_extended, GL_ARB_buffer_storage, 
    GL_ARB_clear_buffer_object, GL_ARB_clear_texture, GL_ARB_clip_control, 
    GL_ARB_color_buffer_float, GL_ARB_compatibility, 
    GL_ARB_compressed_texture_pixel_storage, GL_ARB_compute_shader, 
    GL_ARB_conditional_render_inverted, GL_ARB_conservative_depth, 
    GL_ARB_copy_buffer, GL_ARB_copy_image, GL_ARB_cull_distance, 
    GL_ARB_debug_output, GL_ARB_depth_buffer_float, GL_ARB_depth_clamp, 
    GL_ARB_depth_texture, GL_ARB_derivative_control, 
    GL_ARB_direct_state_access, GL_ARB_draw_buffers, 
    GL_ARB_draw_buffers_blend, GL_ARB_draw_elements_base_vertex, 
    GL_ARB_draw_indirect, GL_ARB_draw_instanced, GL_ARB_enhanced_layouts, 
    GL_ARB_explicit_attrib_location, GL_ARB_explicit_uniform_location, 
    GL_ARB_fragment_coord_conventions, GL_ARB_fragment_layer_viewport, 
    GL_ARB_fragment_program, GL_ARB_fragment_program_shadow, 
    GL_ARB_fragment_shader, GL_ARB_framebuffer_no_attachments, 
    GL_ARB_framebuffer_object, GL_ARB_framebuffer_sRGB, 
    GL_ARB_get_program_binary, GL_ARB_get_texture_sub_image, GL_ARB_gl_spirv, 
    GL_ARB_gpu_shader5, GL_ARB_gpu_shader_fp64, GL_ARB_gpu_shader_int64, 
    GL_ARB_half_float_pixel, GL_ARB_half_float_vertex, 
    GL_ARB_indirect_parameters, GL_ARB_instanced_arrays, 
    GL_ARB_internalformat_query, GL_ARB_internalformat_query2, 
    GL_ARB_invalidate_subdata, GL_ARB_map_buffer_alignment, 
    GL_ARB_map_buffer_range, GL_ARB_multi_bind, GL_ARB_multi_draw_indirect, 
    GL_ARB_multisample, GL_ARB_multitexture, GL_ARB_occlusion_query, 
    GL_ARB_occlusion_query2, GL_ARB_parallel_shader_compile, 
    GL_ARB_pipeline_statistics_query, GL_ARB_pixel_buffer_object, 
    GL_ARB_point_parameters, GL_ARB_point_sprite, GL_ARB_polygon_offset_clamp, 
    GL_ARB_post_depth_coverage, GL_ARB_program_interface_query, 
    GL_ARB_provoking_vertex, GL_ARB_query_buffer_object, 
    GL_ARB_robust_buffer_access_behavior, GL_ARB_robustness, 
    GL_ARB_sample_shading, GL_ARB_sampler_objects, GL_ARB_seamless_cube_map, 
    GL_ARB_seamless_cubemap_per_texture, GL_ARB_separate_shader_objects, 
    GL_ARB_shader_atomic_counter_ops, GL_ARB_shader_atomic_counters, 
    GL_ARB_shader_ballot, GL_ARB_shader_bit_encoding, GL_ARB_shader_clock, 
    GL_ARB_shader_draw_parameters, GL_ARB_shader_group_vote, 
    GL_ARB_shader_image_load_store, GL_ARB_shader_image_size, 
    GL_ARB_shader_objects, GL_ARB_shader_precision, 
    GL_ARB_shader_stencil_export, GL_ARB_shader_storage_buffer_object, 
    GL_ARB_shader_subroutine, GL_ARB_shader_texture_image_samples, 
    GL_ARB_shader_texture_lod, GL_ARB_shader_viewport_layer_array, 
    GL_ARB_shading_language_100, GL_ARB_shading_language_420pack, 
    GL_ARB_shading_language_include, GL_ARB_shading_language_packing, 
    GL_ARB_shadow, GL_ARB_spirv_extensions, GL_ARB_stencil_texturing, 
    GL_ARB_sync, GL_ARB_tessellation_shader, GL_ARB_texture_barrier, 
    GL_ARB_texture_border_clamp, GL_ARB_texture_buffer_object, 
    GL_ARB_texture_buffer_object_rgb32, GL_ARB_texture_buffer_range, 
    GL_ARB_texture_compression, GL_ARB_texture_compression_bptc, 
    GL_ARB_texture_compression_rgtc, GL_ARB_texture_cube_map, 
    GL_ARB_texture_cube_map_array, GL_ARB_texture_env_add, 
    GL_ARB_texture_env_combine, GL_ARB_texture_env_crossbar, 
    GL_ARB_texture_env_dot3, GL_ARB_texture_filter_anisotropic, 
    GL_ARB_texture_filter_minmax, GL_ARB_texture_float, GL_ARB_texture_gather, 
    GL_ARB_texture_mirror_clamp_to_edge, GL_ARB_texture_mirrored_repeat, 
    GL_ARB_texture_multisample, GL_ARB_texture_non_power_of_two, 
    GL_ARB_texture_query_levels, GL_ARB_texture_query_lod, 
    GL_ARB_texture_rectangle, GL_ARB_texture_rg, GL_ARB_texture_rgb10_a2ui, 
    GL_ARB_texture_stencil8, GL_ARB_texture_storage, 
    GL_ARB_texture_storage_multisample, GL_ARB_texture_swizzle, 
    GL_ARB_texture_view, GL_ARB_timer_query, GL_ARB_transform_feedback2, 
    GL_ARB_transform_feedback3, GL_ARB_transform_feedback_instanced, 
    GL_ARB_transform_feedback_overflow_query, GL_ARB_transpose_matrix, 
    GL_ARB_uniform_buffer_object, GL_ARB_vertex_array_bgra, 
    GL_ARB_vertex_array_object, GL_ARB_vertex_attrib_64bit, 
    GL_ARB_vertex_attrib_binding, GL_ARB_vertex_buffer_object, 
    GL_ARB_vertex_program, GL_ARB_vertex_shader, 
    GL_ARB_vertex_type_10f_11f_11f_rev, GL_ARB_vertex_type_2_10_10_10_rev, 
    GL_ARB_viewport_array, GL_ARB_window_pos, 
    GL_ARM_shader_framebuffer_fetch_depth_stencil, 
    GL_ATI_blend_equation_separate, GL_ATI_draw_buffers, 
    GL_ATI_fragment_shader, GL_ATI_meminfo, GL_ATI_separate_stencil, 
    GL_ATI_texture_compression_3dc, GL_ATI_texture_env_combine3, 
    GL_ATI_texture_float, GL_ATI_texture_mirror_once, 
    GL_EXT_EGL_image_storage, GL_EXT_EGL_sync, GL_EXT_abgr, GL_EXT_bgra, 
    GL_EXT_blend_color, GL_EXT_blend_equation_separate, 
    GL_EXT_blend_func_separate, GL_EXT_blend_minmax, GL_EXT_blend_subtract, 
    GL_EXT_compiled_vertex_array, GL_EXT_copy_texture, GL_EXT_debug_label, 
    GL_EXT_direct_state_access, GL_EXT_draw_buffers2, GL_EXT_draw_instanced, 
    GL_EXT_draw_range_elements, GL_EXT_fog_coord, GL_EXT_framebuffer_blit, 
    GL_EXT_framebuffer_multisample, GL_EXT_framebuffer_multisample_blit_scaled, 
    GL_EXT_framebuffer_object, GL_EXT_framebuffer_sRGB, 
    GL_EXT_gpu_program_parameters, GL_EXT_gpu_shader4, GL_EXT_memory_object, 
    GL_EXT_memory_object_fd, GL_EXT_multi_draw_arrays, 
    GL_EXT_packed_depth_stencil, GL_EXT_packed_float, GL_EXT_packed_pixels, 
    GL_EXT_pixel_buffer_object, GL_EXT_point_parameters, 
    GL_EXT_polygon_offset_clamp, GL_EXT_provoking_vertex, 
    GL_EXT_rescale_normal, GL_EXT_secondary_color, 
    GL_EXT_separate_specular_color, GL_EXT_shader_framebuffer_fetch, 
    GL_EXT_shader_framebuffer_fetch_non_coherent, GL_EXT_shader_integer_mix, 
    GL_EXT_shadow_funcs, GL_EXT_stencil_two_side, GL_EXT_stencil_wrap, 
    GL_EXT_subtexture, GL_EXT_texture, GL_EXT_texture3D, 
    GL_EXT_texture_array, GL_EXT_texture_buffer_object, 
    GL_EXT_texture_compression_dxt1, GL_EXT_texture_compression_latc, 
    GL_EXT_texture_compression_rgtc, GL_EXT_texture_compression_s3tc, 
    GL_EXT_texture_cube_map, GL_EXT_texture_edge_clamp, 
    GL_EXT_texture_env_add, GL_EXT_texture_env_combine, 
    GL_EXT_texture_env_dot3, GL_EXT_texture_filter_anisotropic, 
    GL_EXT_texture_filter_minmax, GL_EXT_texture_integer, 
    GL_EXT_texture_lod_bias, GL_EXT_texture_mirror_clamp, 
    GL_EXT_texture_object, GL_EXT_texture_rectangle, GL_EXT_texture_sRGB, 
    GL_EXT_texture_sRGB_R8, GL_EXT_texture_sRGB_RG8, 
    GL_EXT_texture_sRGB_decode, GL_EXT_texture_shadow_lod, 
    GL_EXT_texture_shared_exponent, GL_EXT_texture_snorm, 
    GL_EXT_texture_swizzle, GL_EXT_timer_query, GL_EXT_transform_feedback, 
    GL_EXT_vertex_array, GL_EXT_vertex_array_bgra, GL_EXT_vertex_attrib_64bit, 
    GL_IBM_multimode_draw_arrays, GL_IBM_rasterpos_clip, 
    GL_IBM_texture_mirrored_repeat, GL_INGR_blend_func_separate, 
    GL_INTEL_shader_atomic_float_minmax, GL_KHR_blend_equation_advanced, 
    GL_KHR_blend_equation_advanced_coherent, GL_KHR_context_flush_control, 
    GL_KHR_debug, GL_KHR_no_error, GL_KHR_parallel_shader_compile, 
    GL_KHR_robust_buffer_access_behavior, GL_KHR_robustness, 
    GL_KHR_texture_compression_astc_ldr, 
    GL_KHR_texture_compression_astc_sliced_3d, GL_MESA_framebuffer_flip_y, 
    GL_MESA_pack_invert, GL_MESA_shader_integer_functions, 
    GL_MESA_texture_signed_rgba, GL_MESA_window_pos, GL_MESA_ycbcr_texture, 
    GL_NVX_gpu_memory_info, GL_NV_ES1_1_compatibility, GL_NV_blend_square, 
    GL_NV_conditional_render, GL_NV_copy_depth_to_color, GL_NV_copy_image, 
    GL_NV_depth_clamp, GL_NV_fog_distance, GL_NV_half_float, 
    GL_NV_light_max_exponent, GL_NV_packed_depth_stencil, 
    GL_NV_primitive_restart, GL_NV_shader_atomic_float, 
    GL_NV_texgen_reflection, GL_NV_texture_barrier, 
    GL_NV_texture_env_combine4, GL_NV_texture_rectangle, GL_OES_EGL_image, 
    GL_OES_read_format, GL_S3_s3tc, GL_SGIS_generate_mipmap, 
    GL_SGIS_texture_border_clamp, GL_SGIS_texture_edge_clamp, 
    GL_SGIS_texture_lod, GL_SUN_multi_draw_arrays
Memory info (GL_ATI_meminfo):
    VBO free memory - total: 31 MB, largest block: 31 MB
    VBO free aux. memory - total: 29234 MB, largest block: 29234 MB
    Texture free memory - total: 31 MB, largest block: 31 MB
    Texture free aux. memory - total: 29234 MB, largest block: 29234 MB
    Renderbuffer free memory - total: 31 MB, largest block: 31 MB
    Renderbuffer free aux. memory - total: 29234 MB, largest block: 29234 MB
Memory info (GL_NVX_gpu_memory_info):
    Dedicated video memory: 4292931918 MB
    Total available memory: 4292963882 MB
    Currently available dedicated video memory: 31 MB
OpenGL ES profile vendor: Mesa
OpenGL ES profile renderer: llvmpipe (LLVM 15.0.7, 256 bits)
OpenGL ES profile version: OpenGL ES 3.2 Mesa 23.1.3
OpenGL ES profile shading language version: OpenGL ES GLSL ES 3.20
OpenGL ES profile extensions:
    GL_ANDROID_extension_pack_es31a, GL_ANGLE_pack_reverse_row_order, 
    GL_ANGLE_texture_compression_dxt3, GL_ANGLE_texture_compression_dxt5, 
    GL_APPLE_texture_max_level, GL_ARM_shader_framebuffer_fetch_depth_stencil, 
    GL_EXT_EGL_image_storage, GL_EXT_base_instance, 
    GL_EXT_blend_func_extended, GL_EXT_blend_minmax, GL_EXT_buffer_storage, 
    GL_EXT_clear_texture, GL_EXT_clip_control, GL_EXT_clip_cull_distance, 
    GL_EXT_color_buffer_float, GL_EXT_color_buffer_half_float, 
    GL_EXT_compressed_ETC1_RGB8_sub_texture, GL_EXT_copy_image, 
    GL_EXT_debug_label, GL_EXT_depth_clamp, GL_EXT_discard_framebuffer, 
    GL_EXT_disjoint_timer_query, GL_EXT_draw_buffers, 
    GL_EXT_draw_buffers_indexed, GL_EXT_draw_elements_base_vertex, 
    GL_EXT_draw_instanced, GL_EXT_float_blend, GL_EXT_frag_depth, 
    GL_EXT_geometry_point_size, GL_EXT_geometry_shader, GL_EXT_gpu_shader5, 
    GL_EXT_instanced_arrays, GL_EXT_map_buffer_range, GL_EXT_memory_object, 
    GL_EXT_memory_object_fd, GL_EXT_multi_draw_arrays, 
    GL_EXT_occlusion_query_boolean, GL_EXT_polygon_offset_clamp, 
    GL_EXT_primitive_bounding_box, GL_EXT_read_format_bgra, 
    GL_EXT_render_snorm, GL_EXT_robustness, GL_EXT_sRGB_write_control, 
    GL_EXT_separate_shader_objects, GL_EXT_shader_framebuffer_fetch, 
    GL_EXT_shader_framebuffer_fetch_non_coherent, GL_EXT_shader_group_vote, 
    GL_EXT_shader_implicit_conversions, GL_EXT_shader_integer_mix, 
    GL_EXT_shader_io_blocks, GL_EXT_tessellation_point_size, 
    GL_EXT_tessellation_shader, GL_EXT_texture_border_clamp, 
    GL_EXT_texture_buffer, GL_EXT_texture_compression_bptc, 
    GL_EXT_texture_compression_dxt1, GL_EXT_texture_compression_rgtc, 
    GL_EXT_texture_compression_s3tc, GL_EXT_texture_compression_s3tc_srgb, 
    GL_EXT_texture_cube_map_array, GL_EXT_texture_filter_anisotropic, 
    GL_EXT_texture_filter_minmax, GL_EXT_texture_format_BGRA8888, 
    GL_EXT_texture_mirror_clamp_to_edge, GL_EXT_texture_norm16, 
    GL_EXT_texture_query_lod, GL_EXT_texture_rg, GL_EXT_texture_sRGB_R8, 
    GL_EXT_texture_sRGB_RG8, GL_EXT_texture_sRGB_decode, 
    GL_EXT_texture_shadow_lod, GL_EXT_texture_type_2_10_10_10_REV, 
    GL_EXT_texture_view, GL_EXT_unpack_subimage, 
    GL_KHR_blend_equation_advanced, GL_KHR_blend_equation_advanced_coherent, 
    GL_KHR_context_flush_control, GL_KHR_debug, GL_KHR_no_error, 
    GL_KHR_parallel_shader_compile, GL_KHR_robust_buffer_access_behavior, 
    GL_KHR_robustness, GL_KHR_texture_compression_astc_ldr, 
    GL_KHR_texture_compression_astc_sliced_3d, GL_MESA_bgra, 
    GL_MESA_framebuffer_flip_y, GL_MESA_shader_integer_functions, 
    GL_NV_conditional_render, GL_NV_draw_buffers, GL_NV_fbo_color_attachments, 
    GL_NV_generate_mipmap_sRGB, GL_NV_image_formats, GL_NV_pack_subimage, 
    GL_NV_pixel_buffer_object, GL_NV_read_buffer, GL_NV_read_depth, 
    GL_NV_read_depth_stencil, GL_NV_read_stencil, 
    GL_NV_shader_noperspective_interpolation, GL_OES_EGL_image, 
    GL_OES_EGL_image_external, GL_OES_EGL_image_external_essl3, 
    GL_OES_EGL_sync, GL_OES_compressed_ETC1_RGB8_texture, GL_OES_copy_image, 
    GL_OES_depth24, GL_OES_depth_texture, GL_OES_depth_texture_cube_map, 
    GL_OES_draw_buffers_indexed, GL_OES_draw_elements_base_vertex, 
    GL_OES_element_index_uint, GL_OES_fbo_render_mipmap, 
    GL_OES_geometry_point_size, GL_OES_geometry_shader, 
    GL_OES_get_program_binary, GL_OES_gpu_shader5, GL_OES_mapbuffer, 
    GL_OES_packed_depth_stencil, GL_OES_primitive_bounding_box, 
    GL_OES_required_internalformat, GL_OES_rgb8_rgba8, GL_OES_sample_shading, 
    GL_OES_sample_variables, GL_OES_shader_image_atomic, 
    GL_OES_shader_io_blocks, GL_OES_shader_multisample_interpolation, 
    GL_OES_standard_derivatives, GL_OES_stencil8, GL_OES_surfaceless_context, 
    GL_OES_tessellation_point_size, GL_OES_tessellation_shader, 
    GL_OES_texture_3D, GL_OES_texture_border_clamp, GL_OES_texture_buffer, 
    GL_OES_texture_cube_map_array, GL_OES_texture_float, 
    GL_OES_texture_float_linear, GL_OES_texture_half_float, 
    GL_OES_texture_half_float_linear, GL_OES_texture_npot, 
    GL_OES_texture_stencil8, GL_OES_texture_storage_multisample_2d_array, 
    GL_OES_texture_view, GL_OES_vertex_array_object, GL_OES_vertex_half_float, 
    GL_OES_viewport_array
Configurations:
     bf lv colorbuffer dp st  ms    vis   cav bi  renderable  supported
  id sz  l  r  g  b  a th cl ns b    id   eat nd gl es es2 vg surfaces 
---------------------------------------------------------------------
0x01 32  0 10 10 10  2  0  0  0 0 0x00--      a  y  y  y     pb
0x02 32  0 10 10 10  2 16  0  0 0 0x00--      a  y  y  y     pb
0x03 32  0 10 10 10  2 24  0  0 0 0x00--      a  y  y  y     pb
0x04 32  0 10 10 10  2 24  8  0 0 0x00--      a  y  y  y     pb
0x05 32  0 10 10 10  2 32  0  0 0 0x00--      a  y  y  y     pb
0x06 32  0 10 10 10  2  0  0  4 1 0x00--      a  y  y  y     pb
0x07 32  0 10 10 10  2 16  0  4 1 0x00--      a  y  y  y     pb
0x08 32  0 10 10 10  2 24  0  4 1 0x00--      a  y  y  y     pb
0x09 32  0 10 10 10  2 24  8  4 1 0x00--      a  y  y  y     pb
0x0a 32  0 10 10 10  2 32  0  4 1 0x00--      a  y  y  y     pb
0x0b 30  0 10 10 10  0  0  0  0 0 0x00--      y  y  y  y     pb
0x0c 30  0 10 10 10  0 16  0  0 0 0x00--      y  y  y  y     pb
0x0d 30  0 10 10 10  0 24  0  0 0 0x00--      y  y  y  y     pb
0x0e 30  0 10 10 10  0 24  8  0 0 0x00--      y  y  y  y     pb
0x0f 30  0 10 10 10  0 32  0  0 0 0x00--      y  y  y  y     pb
0x10 30  0 10 10 10  0  0  0  4 1 0x00--      y  y  y  y     pb
0x11 30  0 10 10 10  0 16  0  4 1 0x00--      y  y  y  y     pb
0x12 30  0 10 10 10  0 24  0  4 1 0x00--      y  y  y  y     pb
0x13 30  0 10 10 10  0 24  8  4 1 0x00--      y  y  y  y     pb
0x14 30  0 10 10 10  0 32  0  4 1 0x00--      y  y  y  y     pb
0x15 32  0  8  8  8  8  0  0  0 0 0x00--      a  y  y  y     pb
0x16 32  0  8  8  8  8 16  0  0 0 0x00--      a  y  y  y     pb
0x17 32  0  8  8  8  8 24  0  0 0 0x00--      a  y  y  y     pb
0x18 32  0  8  8  8  8 24  8  0 0 0x00--      a  y  y  y     pb
0x19 32  0  8  8  8  8 32  0  0 0 0x00--      a  y  y  y     pb
0x1a 32  0  8  8  8  8  0  0  4 1 0x00--      a  y  y  y     pb
0x1b 32  0  8  8  8  8 16  0  4 1 0x00--      a  y  y  y     pb
0x1c 32  0  8  8  8  8 24  0  4 1 0x00--      a  y  y  y     pb
0x1d 32  0  8  8  8  8 24  8  4 1 0x00--      a  y  y  y     pb
0x1e 32  0  8  8  8  8 32  0  4 1 0x00--      a  y  y  y     pb
0x1f 24  0  8  8  8  0  0  0  0 0 0x00--      y  y  y  y     pb
0x20 24  0  8  8  8  0 16  0  0 0 0x00--      y  y  y  y     pb
0x21 24  0  8  8  8  0 24  0  0 0 0x00--      y  y  y  y     pb
0x22 24  0  8  8  8  0 24  8  0 0 0x00--      y  y  y  y     pb
0x23 24  0  8  8  8  0 32  0  0 0 0x00--      y  y  y  y     pb
0x24 24  0  8  8  8  0  0  0  4 1 0x00--      y  y  y  y     pb
0x25 24  0  8  8  8  0 16  0  4 1 0x00--      y  y  y  y     pb
0x26 24  0  8  8  8  0 24  0  4 1 0x00--      y  y  y  y     pb
0x27 24  0  8  8  8  0 24  8  4 1 0x00--      y  y  y  y     pb
0x28 24  0  8  8  8  0 32  0  4 1 0x00--      y  y  y  y     pb
0x29 16  0  5  6  5  0  0  0  0 0 0x00--      y  y  y  y     pb
0x2a 16  0  5  6  5  0 16  0  0 0 0x00--      y  y  y  y     pb
0x2b 16  0  5  6  5  0 24  0  0 0 0x00--      y  y  y  y     pb
0x2c 16  0  5  6  5  0 24  8  0 0 0x00--      y  y  y  y     pb
0x2d 16  0  5  6  5  0 32  0  0 0 0x00--      y  y  y  y     pb
0x2e 16  0  5  6  5  0  0  0  4 1 0x00--      y  y  y  y     pb
0x2f 16  0  5  6  5  0 16  0  4 1 0x00--      y  y  y  y     pb
0x30 16  0  5  6  5  0 24  0  4 1 0x00--      y  y  y  y     pb
0x31 16  0  5  6  5  0 24  8  4 1 0x00--      y  y  y  y     pb
0x32 16  0  5  6  5  0 32  0  4 1 0x00--      y  y  y  y     pb
```

## OpenGL (GLX)

```zsh
name of display: :1
display: :1  screen: 0
direct rendering: Yes
server glx vendor string: SGI
server glx version string: 1.4
server glx extensions:
    GLX_ARB_context_flush_control, GLX_ARB_create_context, 
    GLX_ARB_create_context_no_error, GLX_ARB_create_context_profile, 
    GLX_ARB_create_context_robustness, GLX_ARB_fbconfig_float, 
    GLX_ARB_framebuffer_sRGB, GLX_ARB_multisample, 
    GLX_EXT_create_context_es2_profile, GLX_EXT_create_context_es_profile, 
    GLX_EXT_fbconfig_packed_float, GLX_EXT_framebuffer_sRGB, 
    GLX_EXT_get_drawable_type, GLX_EXT_libglvnd, GLX_EXT_no_config_context, 
    GLX_EXT_texture_from_pixmap, GLX_EXT_visual_info, GLX_EXT_visual_rating, 
    GLX_MESA_copy_sub_buffer, GLX_OML_swap_method, GLX_SGIS_multisample, 
    GLX_SGIX_fbconfig, GLX_SGIX_pbuffer, GLX_SGIX_visual_select_group, 
    GLX_SGI_make_current_read
client glx vendor string: Mesa Project and SGI
client glx version string: 1.4
client glx extensions:
    GLX_ARB_context_flush_control, GLX_ARB_create_context, 
    GLX_ARB_create_context_no_error, GLX_ARB_create_context_profile, 
    GLX_ARB_create_context_robustness, GLX_ARB_fbconfig_float, 
    GLX_ARB_framebuffer_sRGB, GLX_ARB_get_proc_address, GLX_ARB_multisample, 
    GLX_ATI_pixel_format_float, GLX_EXT_buffer_age, 
    GLX_EXT_create_context_es2_profile, GLX_EXT_create_context_es_profile, 
    GLX_EXT_fbconfig_packed_float, GLX_EXT_framebuffer_sRGB, 
    GLX_EXT_import_context, GLX_EXT_no_config_context, GLX_EXT_swap_control, 
    GLX_EXT_swap_control_tear, GLX_EXT_texture_from_pixmap, 
    GLX_EXT_visual_info, GLX_EXT_visual_rating, GLX_INTEL_swap_event, 
    GLX_MESA_copy_sub_buffer, GLX_MESA_query_renderer, GLX_MESA_swap_control, 
    GLX_NV_float_buffer, GLX_OML_swap_method, GLX_OML_sync_control, 
    GLX_SGIS_multisample, GLX_SGIX_fbconfig, GLX_SGIX_pbuffer, 
    GLX_SGIX_visual_select_group, GLX_SGI_make_current_read, 
    GLX_SGI_swap_control, GLX_SGI_video_sync
GLX version: 1.4
GLX extensions:
    GLX_ARB_context_flush_control, GLX_ARB_create_context, 
    GLX_ARB_create_context_no_error, GLX_ARB_create_context_profile, 
    GLX_ARB_create_context_robustness, GLX_ARB_fbconfig_float, 
    GLX_ARB_framebuffer_sRGB, GLX_ARB_get_proc_address, GLX_ARB_multisample, 
    GLX_EXT_buffer_age, GLX_EXT_create_context_es2_profile, 
    GLX_EXT_create_context_es_profile, GLX_EXT_fbconfig_packed_float, 
    GLX_EXT_framebuffer_sRGB, GLX_EXT_no_config_context, GLX_EXT_swap_control, 
    GLX_EXT_swap_control_tear, GLX_EXT_texture_from_pixmap, 
    GLX_EXT_visual_info, GLX_EXT_visual_rating, GLX_MESA_copy_sub_buffer, 
    GLX_MESA_query_renderer, GLX_MESA_swap_control, GLX_OML_swap_method, 
    GLX_OML_sync_control, GLX_SGIS_multisample, GLX_SGIX_fbconfig, 
    GLX_SGIX_pbuffer, GLX_SGIX_visual_select_group, GLX_SGI_make_current_read, 
    GLX_SGI_video_sync
Extended renderer info (GLX_MESA_query_renderer):
    Vendor: AMD (0x1002)
    Device: AMD Radeon RX 5500 XT (navi14, LLVM 15.0.7, DRM 3.52, 6.3.9-arch1-1) (0x7340)
    Version: 23.1.3
    Accelerated: yes
    Video memory: 4096MB
    Unified memory: no
    Preferred profile: core (0x1)
    Max core profile version: 4.6
    Max compat profile version: 4.6
    Max GLES1 profile version: 1.1
    Max GLES[23] profile version: 3.2
Memory info (GL_ATI_meminfo):
    VBO free memory - total: 2510 MB, largest block: 2510 MB
    VBO free aux. memory - total: 15863 MB, largest block: 15863 MB
    Texture free memory - total: 2510 MB, largest block: 2510 MB
    Texture free aux. memory - total: 15863 MB, largest block: 15863 MB
    Renderbuffer free memory - total: 2510 MB, largest block: 2510 MB
    Renderbuffer free aux. memory - total: 15863 MB, largest block: 15863 MB
Memory info (GL_NVX_gpu_memory_info):
    Dedicated video memory: 4096 MB
    Total available memory: 20077 MB
    Currently available dedicated video memory: 2510 MB
OpenGL vendor string: AMD
OpenGL renderer string: AMD Radeon RX 5500 XT (navi14, LLVM 15.0.7, DRM 3.52, 6.3.9-arch1-1)
OpenGL core profile version string: 4.6 (Core Profile) Mesa 23.1.3
OpenGL core profile shading language version string: 4.60
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile
OpenGL core profile extensions:
    GL_AMD_conservative_depth, GL_AMD_depth_clamp_separate, 
    GL_AMD_draw_buffers_blend, GL_AMD_framebuffer_multisample_advanced, 
    GL_AMD_gpu_shader_int64, GL_AMD_multi_draw_indirect, 
    GL_AMD_performance_monitor, GL_AMD_pinned_memory, 
    GL_AMD_query_buffer_object, GL_AMD_seamless_cubemap_per_texture, 
    GL_AMD_shader_stencil_export, GL_AMD_shader_trinary_minmax, 
    GL_AMD_texture_texture4, GL_AMD_vertex_shader_layer, 
    GL_AMD_vertex_shader_viewport_index, GL_ANGLE_texture_compression_dxt3, 
    GL_ANGLE_texture_compression_dxt5, GL_ARB_ES2_compatibility, 
    GL_ARB_ES3_1_compatibility, GL_ARB_ES3_2_compatibility, 
    GL_ARB_ES3_compatibility, GL_ARB_arrays_of_arrays, GL_ARB_base_instance, 
    GL_ARB_bindless_texture, GL_ARB_blend_func_extended, 
    GL_ARB_buffer_storage, GL_ARB_clear_buffer_object, GL_ARB_clear_texture, 
    GL_ARB_clip_control, GL_ARB_color_buffer_float, 
    GL_ARB_compressed_texture_pixel_storage, GL_ARB_compute_shader, 
    GL_ARB_compute_variable_group_size, GL_ARB_conditional_render_inverted, 
    GL_ARB_conservative_depth, GL_ARB_copy_buffer, GL_ARB_copy_image, 
    GL_ARB_cull_distance, GL_ARB_debug_output, GL_ARB_depth_buffer_float, 
    GL_ARB_depth_clamp, GL_ARB_derivative_control, GL_ARB_direct_state_access, 
    GL_ARB_draw_buffers, GL_ARB_draw_buffers_blend, 
    GL_ARB_draw_elements_base_vertex, GL_ARB_draw_indirect, 
    GL_ARB_draw_instanced, GL_ARB_enhanced_layouts, 
    GL_ARB_explicit_attrib_location, GL_ARB_explicit_uniform_location, 
    GL_ARB_fragment_coord_conventions, GL_ARB_fragment_layer_viewport, 
    GL_ARB_fragment_shader, GL_ARB_framebuffer_no_attachments, 
    GL_ARB_framebuffer_object, GL_ARB_framebuffer_sRGB, 
    GL_ARB_get_program_binary, GL_ARB_get_texture_sub_image, GL_ARB_gl_spirv, 
    GL_ARB_gpu_shader5, GL_ARB_gpu_shader_fp64, GL_ARB_gpu_shader_int64, 
    GL_ARB_half_float_pixel, GL_ARB_half_float_vertex, 
    GL_ARB_indirect_parameters, GL_ARB_instanced_arrays, 
    GL_ARB_internalformat_query, GL_ARB_internalformat_query2, 
    GL_ARB_invalidate_subdata, GL_ARB_map_buffer_alignment, 
    GL_ARB_map_buffer_range, GL_ARB_multi_bind, GL_ARB_multi_draw_indirect, 
    GL_ARB_occlusion_query2, GL_ARB_parallel_shader_compile, 
    GL_ARB_pipeline_statistics_query, GL_ARB_pixel_buffer_object, 
    GL_ARB_point_sprite, GL_ARB_polygon_offset_clamp, 
    GL_ARB_post_depth_coverage, GL_ARB_program_interface_query, 
    GL_ARB_provoking_vertex, GL_ARB_query_buffer_object, 
    GL_ARB_robust_buffer_access_behavior, GL_ARB_robustness, 
    GL_ARB_sample_shading, GL_ARB_sampler_objects, GL_ARB_seamless_cube_map, 
    GL_ARB_seamless_cubemap_per_texture, GL_ARB_separate_shader_objects, 
    GL_ARB_shader_atomic_counter_ops, GL_ARB_shader_atomic_counters, 
    GL_ARB_shader_ballot, GL_ARB_shader_bit_encoding, GL_ARB_shader_clock, 
    GL_ARB_shader_draw_parameters, GL_ARB_shader_group_vote, 
    GL_ARB_shader_image_load_store, GL_ARB_shader_image_size, 
    GL_ARB_shader_objects, GL_ARB_shader_precision, 
    GL_ARB_shader_stencil_export, GL_ARB_shader_storage_buffer_object, 
    GL_ARB_shader_subroutine, GL_ARB_shader_texture_image_samples, 
    GL_ARB_shader_texture_lod, GL_ARB_shader_viewport_layer_array, 
    GL_ARB_shading_language_420pack, GL_ARB_shading_language_include, 
    GL_ARB_shading_language_packing, GL_ARB_sparse_buffer, 
    GL_ARB_sparse_texture, GL_ARB_sparse_texture2, 
    GL_ARB_sparse_texture_clamp, GL_ARB_spirv_extensions, 
    GL_ARB_stencil_texturing, GL_ARB_sync, GL_ARB_tessellation_shader, 
    GL_ARB_texture_barrier, GL_ARB_texture_buffer_object, 
    GL_ARB_texture_buffer_object_rgb32, GL_ARB_texture_buffer_range, 
    GL_ARB_texture_compression_bptc, GL_ARB_texture_compression_rgtc, 
    GL_ARB_texture_cube_map_array, GL_ARB_texture_filter_anisotropic, 
    GL_ARB_texture_float, GL_ARB_texture_gather, 
    GL_ARB_texture_mirror_clamp_to_edge, GL_ARB_texture_multisample, 
    GL_ARB_texture_non_power_of_two, GL_ARB_texture_query_levels, 
    GL_ARB_texture_query_lod, GL_ARB_texture_rectangle, GL_ARB_texture_rg, 
    GL_ARB_texture_rgb10_a2ui, GL_ARB_texture_stencil8, 
    GL_ARB_texture_storage, GL_ARB_texture_storage_multisample, 
    GL_ARB_texture_swizzle, GL_ARB_texture_view, GL_ARB_timer_query, 
    GL_ARB_transform_feedback2, GL_ARB_transform_feedback3, 
    GL_ARB_transform_feedback_instanced, 
    GL_ARB_transform_feedback_overflow_query, GL_ARB_uniform_buffer_object, 
    GL_ARB_vertex_array_bgra, GL_ARB_vertex_array_object, 
    GL_ARB_vertex_attrib_64bit, GL_ARB_vertex_attrib_binding, 
    GL_ARB_vertex_buffer_object, GL_ARB_vertex_shader, 
    GL_ARB_vertex_type_10f_11f_11f_rev, GL_ARB_vertex_type_2_10_10_10_rev, 
    GL_ARB_viewport_array, GL_ATI_blend_equation_separate, GL_ATI_meminfo, 
    GL_ATI_texture_float, GL_ATI_texture_mirror_once, 
    GL_EXT_EGL_image_storage, GL_EXT_EGL_sync, GL_EXT_abgr, 
    GL_EXT_blend_equation_separate, GL_EXT_debug_label, 
    GL_EXT_demote_to_helper_invocation, GL_EXT_depth_bounds_test, 
    GL_EXT_draw_buffers2, GL_EXT_draw_instanced, GL_EXT_framebuffer_blit, 
    GL_EXT_framebuffer_multisample, GL_EXT_framebuffer_multisample_blit_scaled, 
    GL_EXT_framebuffer_object, GL_EXT_framebuffer_sRGB, GL_EXT_memory_object, 
    GL_EXT_memory_object_fd, GL_EXT_packed_depth_stencil, GL_EXT_packed_float, 
    GL_EXT_pixel_buffer_object, GL_EXT_polygon_offset_clamp, 
    GL_EXT_provoking_vertex, GL_EXT_semaphore, GL_EXT_semaphore_fd, 
    GL_EXT_shader_image_load_formatted, GL_EXT_shader_image_load_store, 
    GL_EXT_shader_integer_mix, GL_EXT_shader_samples_identical, 
    GL_EXT_texture_array, GL_EXT_texture_compression_dxt1, 
    GL_EXT_texture_compression_rgtc, GL_EXT_texture_compression_s3tc, 
    GL_EXT_texture_filter_anisotropic, GL_EXT_texture_integer, 
    GL_EXT_texture_mirror_clamp, GL_EXT_texture_sRGB, GL_EXT_texture_sRGB_R8, 
    GL_EXT_texture_sRGB_RG8, GL_EXT_texture_sRGB_decode, 
    GL_EXT_texture_shadow_lod, GL_EXT_texture_shared_exponent, 
    GL_EXT_texture_snorm, GL_EXT_texture_swizzle, GL_EXT_timer_query, 
    GL_EXT_transform_feedback, GL_EXT_vertex_array_bgra, 
    GL_EXT_vertex_attrib_64bit, GL_EXT_window_rectangles, 
    GL_IBM_multimode_draw_arrays, GL_INTEL_blackhole_render, 
    GL_KHR_blend_equation_advanced, GL_KHR_context_flush_control, 
    GL_KHR_debug, GL_KHR_no_error, GL_KHR_parallel_shader_compile, 
    GL_KHR_robust_buffer_access_behavior, GL_KHR_robustness, 
    GL_KHR_texture_compression_astc_ldr, 
    GL_KHR_texture_compression_astc_sliced_3d, GL_MESA_framebuffer_flip_y, 
    GL_MESA_pack_invert, GL_MESA_shader_integer_functions, 
    GL_MESA_texture_signed_rgba, GL_NVX_gpu_memory_info, 
    GL_NV_alpha_to_coverage_dither_control, GL_NV_compute_shader_derivatives, 
    GL_NV_conditional_render, GL_NV_copy_image, GL_NV_depth_clamp, 
    GL_NV_packed_depth_stencil, GL_NV_shader_atomic_int64, 
    GL_NV_texture_barrier, GL_NV_vdpau_interop, GL_OES_EGL_image, GL_S3_s3tc

OpenGL version string: 4.6 (Compatibility Profile) Mesa 23.1.3
OpenGL shading language version string: 4.60
OpenGL context flags: (none)
OpenGL profile mask: compatibility profile
OpenGL extensions:
    GL_AMD_conservative_depth, GL_AMD_depth_clamp_separate, 
    GL_AMD_draw_buffers_blend, GL_AMD_framebuffer_multisample_advanced, 
    GL_AMD_multi_draw_indirect, GL_AMD_performance_monitor, 
    GL_AMD_pinned_memory, GL_AMD_query_buffer_object, 
    GL_AMD_seamless_cubemap_per_texture, GL_AMD_shader_stencil_export, 
    GL_AMD_shader_trinary_minmax, GL_AMD_texture_texture4, 
    GL_AMD_vertex_shader_layer, GL_AMD_vertex_shader_viewport_index, 
    GL_ANGLE_texture_compression_dxt3, GL_ANGLE_texture_compression_dxt5, 
    GL_APPLE_packed_pixels, GL_ARB_ES2_compatibility, 
    GL_ARB_ES3_1_compatibility, GL_ARB_ES3_2_compatibility, 
    GL_ARB_ES3_compatibility, GL_ARB_arrays_of_arrays, GL_ARB_base_instance, 
    GL_ARB_bindless_texture, GL_ARB_blend_func_extended, 
    GL_ARB_buffer_storage, GL_ARB_clear_buffer_object, GL_ARB_clear_texture, 
    GL_ARB_clip_control, GL_ARB_color_buffer_float, GL_ARB_compatibility, 
    GL_ARB_compressed_texture_pixel_storage, GL_ARB_compute_shader, 
    GL_ARB_compute_variable_group_size, GL_ARB_conditional_render_inverted, 
    GL_ARB_conservative_depth, GL_ARB_copy_buffer, GL_ARB_copy_image, 
    GL_ARB_cull_distance, GL_ARB_debug_output, GL_ARB_depth_buffer_float, 
    GL_ARB_depth_clamp, GL_ARB_depth_texture, GL_ARB_derivative_control, 
    GL_ARB_direct_state_access, GL_ARB_draw_buffers, 
    GL_ARB_draw_buffers_blend, GL_ARB_draw_elements_base_vertex, 
    GL_ARB_draw_indirect, GL_ARB_draw_instanced, GL_ARB_enhanced_layouts, 
    GL_ARB_explicit_attrib_location, GL_ARB_explicit_uniform_location, 
    GL_ARB_fragment_coord_conventions, GL_ARB_fragment_layer_viewport, 
    GL_ARB_fragment_program, GL_ARB_fragment_program_shadow, 
    GL_ARB_fragment_shader, GL_ARB_framebuffer_no_attachments, 
    GL_ARB_framebuffer_object, GL_ARB_framebuffer_sRGB, 
    GL_ARB_get_program_binary, GL_ARB_get_texture_sub_image, GL_ARB_gl_spirv, 
    GL_ARB_gpu_shader5, GL_ARB_gpu_shader_fp64, GL_ARB_gpu_shader_int64, 
    GL_ARB_half_float_pixel, GL_ARB_half_float_vertex, 
    GL_ARB_indirect_parameters, GL_ARB_instanced_arrays, 
    GL_ARB_internalformat_query, GL_ARB_internalformat_query2, 
    GL_ARB_invalidate_subdata, GL_ARB_map_buffer_alignment, 
    GL_ARB_map_buffer_range, GL_ARB_multi_bind, GL_ARB_multi_draw_indirect, 
    GL_ARB_multisample, GL_ARB_multitexture, GL_ARB_occlusion_query, 
    GL_ARB_occlusion_query2, GL_ARB_parallel_shader_compile, 
    GL_ARB_pipeline_statistics_query, GL_ARB_pixel_buffer_object, 
    GL_ARB_point_parameters, GL_ARB_point_sprite, GL_ARB_polygon_offset_clamp, 
    GL_ARB_post_depth_coverage, GL_ARB_program_interface_query, 
    GL_ARB_provoking_vertex, GL_ARB_query_buffer_object, 
    GL_ARB_robust_buffer_access_behavior, GL_ARB_robustness, 
    GL_ARB_sample_shading, GL_ARB_sampler_objects, GL_ARB_seamless_cube_map, 
    GL_ARB_seamless_cubemap_per_texture, GL_ARB_separate_shader_objects, 
    GL_ARB_shader_atomic_counter_ops, GL_ARB_shader_atomic_counters, 
    GL_ARB_shader_ballot, GL_ARB_shader_bit_encoding, GL_ARB_shader_clock, 
    GL_ARB_shader_draw_parameters, GL_ARB_shader_group_vote, 
    GL_ARB_shader_image_load_store, GL_ARB_shader_image_size, 
    GL_ARB_shader_objects, GL_ARB_shader_precision, 
    GL_ARB_shader_stencil_export, GL_ARB_shader_storage_buffer_object, 
    GL_ARB_shader_subroutine, GL_ARB_shader_texture_image_samples, 
    GL_ARB_shader_texture_lod, GL_ARB_shader_viewport_layer_array, 
    GL_ARB_shading_language_100, GL_ARB_shading_language_420pack, 
    GL_ARB_shading_language_include, GL_ARB_shading_language_packing, 
    GL_ARB_shadow, GL_ARB_sparse_buffer, GL_ARB_sparse_texture, 
    GL_ARB_sparse_texture2, GL_ARB_sparse_texture_clamp, 
    GL_ARB_spirv_extensions, GL_ARB_stencil_texturing, GL_ARB_sync, 
    GL_ARB_tessellation_shader, GL_ARB_texture_barrier, 
    GL_ARB_texture_border_clamp, GL_ARB_texture_buffer_object, 
    GL_ARB_texture_buffer_object_rgb32, GL_ARB_texture_buffer_range, 
    GL_ARB_texture_compression, GL_ARB_texture_compression_bptc, 
    GL_ARB_texture_compression_rgtc, GL_ARB_texture_cube_map, 
    GL_ARB_texture_cube_map_array, GL_ARB_texture_env_add, 
    GL_ARB_texture_env_combine, GL_ARB_texture_env_crossbar, 
    GL_ARB_texture_env_dot3, GL_ARB_texture_filter_anisotropic, 
    GL_ARB_texture_float, GL_ARB_texture_gather, 
    GL_ARB_texture_mirror_clamp_to_edge, GL_ARB_texture_mirrored_repeat, 
    GL_ARB_texture_multisample, GL_ARB_texture_non_power_of_two, 
    GL_ARB_texture_query_levels, GL_ARB_texture_query_lod, 
    GL_ARB_texture_rectangle, GL_ARB_texture_rg, GL_ARB_texture_rgb10_a2ui, 
    GL_ARB_texture_stencil8, GL_ARB_texture_storage, 
    GL_ARB_texture_storage_multisample, GL_ARB_texture_swizzle, 
    GL_ARB_texture_view, GL_ARB_timer_query, GL_ARB_transform_feedback2, 
    GL_ARB_transform_feedback3, GL_ARB_transform_feedback_instanced, 
    GL_ARB_transform_feedback_overflow_query, GL_ARB_transpose_matrix, 
    GL_ARB_uniform_buffer_object, GL_ARB_vertex_array_bgra, 
    GL_ARB_vertex_array_object, GL_ARB_vertex_attrib_64bit, 
    GL_ARB_vertex_attrib_binding, GL_ARB_vertex_buffer_object, 
    GL_ARB_vertex_program, GL_ARB_vertex_shader, 
    GL_ARB_vertex_type_10f_11f_11f_rev, GL_ARB_vertex_type_2_10_10_10_rev, 
    GL_ARB_viewport_array, GL_ARB_window_pos, GL_ATI_blend_equation_separate, 
    GL_ATI_draw_buffers, GL_ATI_fragment_shader, GL_ATI_meminfo, 
    GL_ATI_separate_stencil, GL_ATI_texture_compression_3dc, 
    GL_ATI_texture_env_combine3, GL_ATI_texture_float, 
    GL_ATI_texture_mirror_once, GL_EXT_EGL_image_storage, GL_EXT_EGL_sync, 
    GL_EXT_abgr, GL_EXT_bgra, GL_EXT_blend_color, 
    GL_EXT_blend_equation_separate, GL_EXT_blend_func_separate, 
    GL_EXT_blend_minmax, GL_EXT_blend_subtract, GL_EXT_compiled_vertex_array, 
    GL_EXT_copy_texture, GL_EXT_debug_label, 
    GL_EXT_demote_to_helper_invocation, GL_EXT_depth_bounds_test, 
    GL_EXT_direct_state_access, GL_EXT_draw_buffers2, GL_EXT_draw_instanced, 
    GL_EXT_draw_range_elements, GL_EXT_fog_coord, GL_EXT_framebuffer_blit, 
    GL_EXT_framebuffer_multisample, GL_EXT_framebuffer_multisample_blit_scaled, 
    GL_EXT_framebuffer_object, GL_EXT_framebuffer_sRGB, 
    GL_EXT_gpu_program_parameters, GL_EXT_gpu_shader4, GL_EXT_memory_object, 
    GL_EXT_memory_object_fd, GL_EXT_multi_draw_arrays, 
    GL_EXT_packed_depth_stencil, GL_EXT_packed_float, GL_EXT_packed_pixels, 
    GL_EXT_pixel_buffer_object, GL_EXT_point_parameters, 
    GL_EXT_polygon_offset_clamp, GL_EXT_provoking_vertex, 
    GL_EXT_rescale_normal, GL_EXT_secondary_color, GL_EXT_semaphore, 
    GL_EXT_semaphore_fd, GL_EXT_separate_specular_color, 
    GL_EXT_shader_image_load_formatted, GL_EXT_shader_image_load_store, 
    GL_EXT_shader_integer_mix, GL_EXT_shader_samples_identical, 
    GL_EXT_shadow_funcs, GL_EXT_stencil_two_side, GL_EXT_stencil_wrap, 
    GL_EXT_subtexture, GL_EXT_texture, GL_EXT_texture3D, 
    GL_EXT_texture_array, GL_EXT_texture_buffer_object, 
    GL_EXT_texture_compression_dxt1, GL_EXT_texture_compression_latc, 
    GL_EXT_texture_compression_rgtc, GL_EXT_texture_compression_s3tc, 
    GL_EXT_texture_cube_map, GL_EXT_texture_edge_clamp, 
    GL_EXT_texture_env_add, GL_EXT_texture_env_combine, 
    GL_EXT_texture_env_dot3, GL_EXT_texture_filter_anisotropic, 
    GL_EXT_texture_integer, GL_EXT_texture_lod_bias, 
    GL_EXT_texture_mirror_clamp, GL_EXT_texture_object, 
    GL_EXT_texture_rectangle, GL_EXT_texture_sRGB, GL_EXT_texture_sRGB_R8, 
    GL_EXT_texture_sRGB_RG8, GL_EXT_texture_sRGB_decode, 
    GL_EXT_texture_shadow_lod, GL_EXT_texture_shared_exponent, 
    GL_EXT_texture_snorm, GL_EXT_texture_swizzle, GL_EXT_timer_query, 
    GL_EXT_transform_feedback, GL_EXT_vertex_array, GL_EXT_vertex_array_bgra, 
    GL_EXT_vertex_attrib_64bit, GL_EXT_window_rectangles, 
    GL_IBM_multimode_draw_arrays, GL_IBM_rasterpos_clip, 
    GL_IBM_texture_mirrored_repeat, GL_INGR_blend_func_separate, 
    GL_INTEL_blackhole_render, GL_KHR_blend_equation_advanced, 
    GL_KHR_context_flush_control, GL_KHR_debug, GL_KHR_no_error, 
    GL_KHR_parallel_shader_compile, GL_KHR_robust_buffer_access_behavior, 
    GL_KHR_robustness, GL_KHR_texture_compression_astc_ldr, 
    GL_KHR_texture_compression_astc_sliced_3d, GL_MESA_framebuffer_flip_y, 
    GL_MESA_pack_invert, GL_MESA_shader_integer_functions, 
    GL_MESA_texture_signed_rgba, GL_MESA_window_pos, GL_NVX_gpu_memory_info, 
    GL_NV_ES1_1_compatibility, GL_NV_alpha_to_coverage_dither_control, 
    GL_NV_blend_square, GL_NV_compute_shader_derivatives, 
    GL_NV_conditional_render, GL_NV_copy_depth_to_color, GL_NV_copy_image, 
    GL_NV_depth_clamp, GL_NV_fog_distance, GL_NV_half_float, 
    GL_NV_light_max_exponent, GL_NV_packed_depth_stencil, 
    GL_NV_primitive_restart, GL_NV_shader_atomic_int64, 
    GL_NV_texgen_reflection, GL_NV_texture_barrier, 
    GL_NV_texture_env_combine4, GL_NV_texture_rectangle, GL_NV_vdpau_interop, 
    GL_OES_EGL_image, GL_OES_read_format, GL_S3_s3tc, 
    GL_SGIS_generate_mipmap, GL_SGIS_texture_border_clamp, 
    GL_SGIS_texture_edge_clamp, GL_SGIS_texture_lod, GL_SUN_multi_draw_arrays

OpenGL ES profile version string: OpenGL ES 3.2 Mesa 23.1.3
OpenGL ES profile shading language version string: OpenGL ES GLSL ES 3.20
OpenGL ES profile extensions:
    GL_AMD_framebuffer_multisample_advanced, GL_AMD_performance_monitor, 
    GL_ANDROID_extension_pack_es31a, GL_ANGLE_pack_reverse_row_order, 
    GL_ANGLE_texture_compression_dxt3, GL_ANGLE_texture_compression_dxt5, 
    GL_APPLE_texture_max_level, GL_EXT_EGL_image_storage, 
    GL_EXT_base_instance, GL_EXT_blend_func_extended, GL_EXT_blend_minmax, 
    GL_EXT_buffer_storage, GL_EXT_clear_texture, GL_EXT_clip_control, 
    GL_EXT_clip_cull_distance, GL_EXT_color_buffer_float, 
    GL_EXT_color_buffer_half_float, GL_EXT_compressed_ETC1_RGB8_sub_texture, 
    GL_EXT_copy_image, GL_EXT_debug_label, GL_EXT_demote_to_helper_invocation, 
    GL_EXT_depth_clamp, GL_EXT_discard_framebuffer, 
    GL_EXT_disjoint_timer_query, GL_EXT_draw_buffers, 
    GL_EXT_draw_buffers_indexed, GL_EXT_draw_elements_base_vertex, 
    GL_EXT_draw_instanced, GL_EXT_float_blend, GL_EXT_frag_depth, 
    GL_EXT_geometry_point_size, GL_EXT_geometry_shader, GL_EXT_gpu_shader5, 
    GL_EXT_instanced_arrays, GL_EXT_map_buffer_range, GL_EXT_memory_object, 
    GL_EXT_memory_object_fd, GL_EXT_multi_draw_arrays, 
    GL_EXT_occlusion_query_boolean, GL_EXT_polygon_offset_clamp, 
    GL_EXT_primitive_bounding_box, GL_EXT_read_format_bgra, 
    GL_EXT_render_snorm, GL_EXT_robustness, GL_EXT_sRGB_write_control, 
    GL_EXT_semaphore, GL_EXT_semaphore_fd, GL_EXT_separate_shader_objects, 
    GL_EXT_shader_group_vote, GL_EXT_shader_implicit_conversions, 
    GL_EXT_shader_integer_mix, GL_EXT_shader_io_blocks, 
    GL_EXT_shader_samples_identical, GL_EXT_tessellation_point_size, 
    GL_EXT_tessellation_shader, GL_EXT_texture_border_clamp, 
    GL_EXT_texture_buffer, GL_EXT_texture_compression_bptc, 
    GL_EXT_texture_compression_dxt1, GL_EXT_texture_compression_rgtc, 
    GL_EXT_texture_compression_s3tc, GL_EXT_texture_compression_s3tc_srgb, 
    GL_EXT_texture_cube_map_array, GL_EXT_texture_filter_anisotropic, 
    GL_EXT_texture_format_BGRA8888, GL_EXT_texture_mirror_clamp_to_edge, 
    GL_EXT_texture_norm16, GL_EXT_texture_query_lod, GL_EXT_texture_rg, 
    GL_EXT_texture_sRGB_R8, GL_EXT_texture_sRGB_RG8, 
    GL_EXT_texture_sRGB_decode, GL_EXT_texture_shadow_lod, 
    GL_EXT_texture_type_2_10_10_10_REV, GL_EXT_texture_view, 
    GL_EXT_unpack_subimage, GL_EXT_window_rectangles, 
    GL_INTEL_blackhole_render, GL_KHR_blend_equation_advanced, 
    GL_KHR_context_flush_control, GL_KHR_debug, GL_KHR_no_error, 
    GL_KHR_parallel_shader_compile, GL_KHR_robust_buffer_access_behavior, 
    GL_KHR_robustness, GL_KHR_texture_compression_astc_ldr, 
    GL_KHR_texture_compression_astc_sliced_3d, GL_MESA_bgra, 
    GL_MESA_framebuffer_flip_y, GL_MESA_shader_integer_functions, 
    GL_NV_alpha_to_coverage_dither_control, GL_NV_compute_shader_derivatives, 
    GL_NV_conditional_render, GL_NV_draw_buffers, GL_NV_fbo_color_attachments, 
    GL_NV_generate_mipmap_sRGB, GL_NV_image_formats, GL_NV_pack_subimage, 
    GL_NV_pixel_buffer_object, GL_NV_read_buffer, GL_NV_read_depth, 
    GL_NV_read_depth_stencil, GL_NV_read_stencil, 
    GL_NV_shader_noperspective_interpolation, GL_OES_EGL_image, 
    GL_OES_EGL_image_external, GL_OES_EGL_image_external_essl3, 
    GL_OES_EGL_sync, GL_OES_compressed_ETC1_RGB8_texture, GL_OES_copy_image, 
    GL_OES_depth24, GL_OES_depth_texture, GL_OES_depth_texture_cube_map, 
    GL_OES_draw_buffers_indexed, GL_OES_draw_elements_base_vertex, 
    GL_OES_element_index_uint, GL_OES_fbo_render_mipmap, 
    GL_OES_geometry_point_size, GL_OES_geometry_shader, 
    GL_OES_get_program_binary, GL_OES_gpu_shader5, GL_OES_mapbuffer, 
    GL_OES_packed_depth_stencil, GL_OES_primitive_bounding_box, 
    GL_OES_required_internalformat, GL_OES_rgb8_rgba8, GL_OES_sample_shading, 
    GL_OES_sample_variables, GL_OES_shader_image_atomic, 
    GL_OES_shader_io_blocks, GL_OES_shader_multisample_interpolation, 
    GL_OES_standard_derivatives, GL_OES_stencil8, GL_OES_surfaceless_context, 
    GL_OES_tessellation_point_size, GL_OES_tessellation_shader, 
    GL_OES_texture_3D, GL_OES_texture_border_clamp, GL_OES_texture_buffer, 
    GL_OES_texture_cube_map_array, GL_OES_texture_float, 
    GL_OES_texture_float_linear, GL_OES_texture_half_float, 
    GL_OES_texture_half_float_linear, GL_OES_texture_npot, 
    GL_OES_texture_stencil8, GL_OES_texture_storage_multisample_2d_array, 
    GL_OES_texture_view, GL_OES_vertex_array_object, GL_OES_vertex_half_float, 
    GL_OES_viewport_array

272 GLX Visuals
    visual  x   bf lv rg d st  colorbuffer  sr ax dp st accumbuffer  ms  sw cav
  id dep cl sp  sz l  ci b ro  r  g  b  a F gb bf th cl  r  g  b  a ns b ap eat
----------------------------------------------------------------------------
0x04a 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8  0  0  0  0  0 0 u  None
0x04b 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8  0  0  0  0  0 0 u  None
0x2cb 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0  0  0  0  0  0  0  0 0 u  None
0x2cc 24 tc  0  32  0 r  y .   8  8  8  8 .  s  0  0  0  0  0  0  0  0 0 u  None
0x2cd 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0  0  0  0  0  0  0  0 0 u  None
0x2ce 24 tc  0  32  0 r  . .   8  8  8  8 .  s  0  0  0  0  0  0  0  0 0 u  None
0x2cf 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0  0  0  0  0  0  0  0 0 u  None
0x2d0 24 dc  0  32  0 r  y .   8  8  8  8 .  s  0  0  0  0  0  0  0  0 0 u  None
0x2d1 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0  0  0  0  0  0  0  0 0 u  None
0x2d2 24 dc  0  32  0 r  . .   8  8  8  8 .  s  0  0  0  0  0  0  0  0 0 u  None
0x2d7 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0  0  0  0  0  0 0 u  None
0x2d8 24 tc  0  32  0 r  y .   8  8  8  8 .  s  0 16  0  0  0  0  0  0 0 u  None
0x2d9 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 16  0  0  0  0  0  0 0 u  None
0x2da 24 tc  0  32  0 r  . .   8  8  8  8 .  s  0 16  0  0  0  0  0  0 0 u  None
0x2db 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0  0  0  0  0  0 0 u  None
0x2dc 24 dc  0  32  0 r  y .   8  8  8  8 .  s  0 16  0  0  0  0  0  0 0 u  None
0x2dd 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 16  0  0  0  0  0  0 0 u  None
0x2de 24 dc  0  32  0 r  . .   8  8  8  8 .  s  0 16  0  0  0  0  0  0 0 u  None
0x2e3 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0  0  0  0  0  0 0 u  None
0x2e4 24 tc  0  32  0 r  y .   8  8  8  8 .  s  0 24  0  0  0  0  0  0 0 u  None
0x2e5 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 24  0  0  0  0  0  0 0 u  None
0x2e6 24 tc  0  32  0 r  . .   8  8  8  8 .  s  0 24  0  0  0  0  0  0 0 u  None
0x2e7 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0  0  0  0  0  0 0 u  None
0x2e8 24 dc  0  32  0 r  y .   8  8  8  8 .  s  0 24  0  0  0  0  0  0 0 u  None
0x2e9 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 24  0  0  0  0  0  0 0 u  None
0x2ea 24 dc  0  32  0 r  . .   8  8  8  8 .  s  0 24  0  0  0  0  0  0 0 u  None
0x2ef 24 tc  0  32  0 r  y .   8  8  8  8 .  s  0 24  8  0  0  0  0  0 0 u  None
0x2f0 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 24  8  0  0  0  0  0 0 u  None
0x2f1 24 tc  0  32  0 r  . .   8  8  8  8 .  s  0 24  8  0  0  0  0  0 0 u  None
0x2f2 24 dc  0  32  0 r  y .   8  8  8  8 .  s  0 24  8  0  0  0  0  0 0 u  None
0x2f3 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 24  8  0  0  0  0  0 0 u  None
0x2f4 24 dc  0  32  0 r  . .   8  8  8  8 .  s  0 24  8  0  0  0  0  0 0 u  None
0x2f8 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0  0  0  0  0  0  0  2 1 u  None
0x2f9 24 tc  0  32  0 r  y .   8  8  8  8 .  s  0  0  0  0  0  0  0  2 1 u  None
0x2fa 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0  0  0  0  0  0  0  2 1 u  None
0x2fb 24 tc  0  32  0 r  . .   8  8  8  8 .  s  0  0  0  0  0  0  0  2 1 u  None
0x2fc 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0  0  0  0  0  0  0  2 1 u  None
0x2fd 24 dc  0  32  0 r  y .   8  8  8  8 .  s  0  0  0  0  0  0  0  2 1 u  None
0x2fe 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0  0  0  0  0  0  0  2 1 u  None
0x2ff 24 dc  0  32  0 r  . .   8  8  8  8 .  s  0  0  0  0  0  0  0  2 1 u  None
0x300 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0  0  0  0  0  0  0  4 1 u  None
0x301 24 tc  0  32  0 r  y .   8  8  8  8 .  s  0  0  0  0  0  0  0  4 1 u  None
0x302 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0  0  0  0  0  0  0  4 1 u  None
0x303 24 tc  0  32  0 r  . .   8  8  8  8 .  s  0  0  0  0  0  0  0  4 1 u  None
0x304 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0  0  0  0  0  0  0  4 1 u  None
0x305 24 dc  0  32  0 r  y .   8  8  8  8 .  s  0  0  0  0  0  0  0  4 1 u  None
0x306 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0  0  0  0  0  0  0  4 1 u  None
0x307 24 dc  0  32  0 r  . .   8  8  8  8 .  s  0  0  0  0  0  0  0  4 1 u  None
0x308 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0  0  0  0  0  0  0  8 1 u  None
0x309 24 tc  0  32  0 r  y .   8  8  8  8 .  s  0  0  0  0  0  0  0  8 1 u  None
0x30a 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0  0  0  0  0  0  0  8 1 u  None
0x30b 24 tc  0  32  0 r  . .   8  8  8  8 .  s  0  0  0  0  0  0  0  8 1 u  None
0x30c 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0  0  0  0  0  0  0  8 1 u  None
0x30d 24 dc  0  32  0 r  y .   8  8  8  8 .  s  0  0  0  0  0  0  0  8 1 u  None
0x30e 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0  0  0  0  0  0  0  8 1 u  None
0x30f 24 dc  0  32  0 r  . .   8  8  8  8 .  s  0  0  0  0  0  0  0  8 1 u  None
0x310 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0  0  0  0  0  2 1 u  None
0x311 24 tc  0  32  0 r  y .   8  8  8  8 .  s  0 16  0  0  0  0  0  2 1 u  None
0x312 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 16  0  0  0  0  0  2 1 u  None
0x313 24 tc  0  32  0 r  . .   8  8  8  8 .  s  0 16  0  0  0  0  0  2 1 u  None
0x314 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0  0  0  0  0  2 1 u  None
0x315 24 dc  0  32  0 r  y .   8  8  8  8 .  s  0 16  0  0  0  0  0  2 1 u  None
0x316 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 16  0  0  0  0  0  2 1 u  None
0x317 24 dc  0  32  0 r  . .   8  8  8  8 .  s  0 16  0  0  0  0  0  2 1 u  None
0x318 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0  0  0  0  0  4 1 u  None
0x319 24 tc  0  32  0 r  y .   8  8  8  8 .  s  0 16  0  0  0  0  0  4 1 u  None
0x31a 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 16  0  0  0  0  0  4 1 u  None
0x31b 24 tc  0  32  0 r  . .   8  8  8  8 .  s  0 16  0  0  0  0  0  4 1 u  None
0x31c 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0  0  0  0  0  4 1 u  None
0x31d 24 dc  0  32  0 r  y .   8  8  8  8 .  s  0 16  0  0  0  0  0  4 1 u  None
0x31e 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 16  0  0  0  0  0  4 1 u  None
0x31f 24 dc  0  32  0 r  . .   8  8  8  8 .  s  0 16  0  0  0  0  0  4 1 u  None
0x320 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0  0  0  0  0  8 1 u  None
0x321 24 tc  0  32  0 r  y .   8  8  8  8 .  s  0 16  0  0  0  0  0  8 1 u  None
0x322 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 16  0  0  0  0  0  8 1 u  None
0x323 24 tc  0  32  0 r  . .   8  8  8  8 .  s  0 16  0  0  0  0  0  8 1 u  None
0x324 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0  0  0  0  0  8 1 u  None
0x325 24 dc  0  32  0 r  y .   8  8  8  8 .  s  0 16  0  0  0  0  0  8 1 u  None
0x326 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 16  0  0  0  0  0  8 1 u  None
0x327 24 dc  0  32  0 r  . .   8  8  8  8 .  s  0 16  0  0  0  0  0  8 1 u  None
0x328 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0  0  0  0  0  2 1 u  None
0x329 24 tc  0  32  0 r  y .   8  8  8  8 .  s  0 24  0  0  0  0  0  2 1 u  None
0x32a 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 24  0  0  0  0  0  2 1 u  None
0x32b 24 tc  0  32  0 r  . .   8  8  8  8 .  s  0 24  0  0  0  0  0  2 1 u  None
0x32c 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0  0  0  0  0  2 1 u  None
0x32d 24 dc  0  32  0 r  y .   8  8  8  8 .  s  0 24  0  0  0  0  0  2 1 u  None
0x32e 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 24  0  0  0  0  0  2 1 u  None
0x32f 24 dc  0  32  0 r  . .   8  8  8  8 .  s  0 24  0  0  0  0  0  2 1 u  None
0x330 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0  0  0  0  0  4 1 u  None
0x331 24 tc  0  32  0 r  y .   8  8  8  8 .  s  0 24  0  0  0  0  0  4 1 u  None
0x332 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 24  0  0  0  0  0  4 1 u  None
0x333 24 tc  0  32  0 r  . .   8  8  8  8 .  s  0 24  0  0  0  0  0  4 1 u  None
0x334 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0  0  0  0  0  4 1 u  None
0x335 24 dc  0  32  0 r  y .   8  8  8  8 .  s  0 24  0  0  0  0  0  4 1 u  None
0x336 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 24  0  0  0  0  0  4 1 u  None
0x337 24 dc  0  32  0 r  . .   8  8  8  8 .  s  0 24  0  0  0  0  0  4 1 u  None
0x338 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0  0  0  0  0  8 1 u  None
0x339 24 tc  0  32  0 r  y .   8  8  8  8 .  s  0 24  0  0  0  0  0  8 1 u  None
0x33a 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 24  0  0  0  0  0  8 1 u  None
0x33b 24 tc  0  32  0 r  . .   8  8  8  8 .  s  0 24  0  0  0  0  0  8 1 u  None
0x33c 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0  0  0  0  0  8 1 u  None
0x33d 24 dc  0  32  0 r  y .   8  8  8  8 .  s  0 24  0  0  0  0  0  8 1 u  None
0x33e 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 24  0  0  0  0  0  8 1 u  None
0x33f 24 dc  0  32  0 r  . .   8  8  8  8 .  s  0 24  0  0  0  0  0  8 1 u  None
0x340 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8  0  0  0  0  2 1 u  None
0x341 24 tc  0  32  0 r  y .   8  8  8  8 .  s  0 24  8  0  0  0  0  2 1 u  None
0x342 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 24  8  0  0  0  0  2 1 u  None
0x343 24 tc  0  32  0 r  . .   8  8  8  8 .  s  0 24  8  0  0  0  0  2 1 u  None
0x344 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8  0  0  0  0  2 1 u  None
0x345 24 dc  0  32  0 r  y .   8  8  8  8 .  s  0 24  8  0  0  0  0  2 1 u  None
0x346 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 24  8  0  0  0  0  2 1 u  None
0x347 24 dc  0  32  0 r  . .   8  8  8  8 .  s  0 24  8  0  0  0  0  2 1 u  None
0x348 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8  0  0  0  0  4 1 u  None
0x349 24 tc  0  32  0 r  y .   8  8  8  8 .  s  0 24  8  0  0  0  0  4 1 u  None
0x34a 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 24  8  0  0  0  0  4 1 u  None
0x34b 24 tc  0  32  0 r  . .   8  8  8  8 .  s  0 24  8  0  0  0  0  4 1 u  None
0x34c 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8  0  0  0  0  4 1 u  None
0x34d 24 dc  0  32  0 r  y .   8  8  8  8 .  s  0 24  8  0  0  0  0  4 1 u  None
0x34e 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 24  8  0  0  0  0  4 1 u  None
0x34f 24 dc  0  32  0 r  . .   8  8  8  8 .  s  0 24  8  0  0  0  0  4 1 u  None
0x350 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8  0  0  0  0  8 1 u  None
0x351 24 tc  0  32  0 r  y .   8  8  8  8 .  s  0 24  8  0  0  0  0  8 1 u  None
0x352 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 24  8  0  0  0  0  8 1 u  None
0x353 24 tc  0  32  0 r  . .   8  8  8  8 .  s  0 24  8  0  0  0  0  8 1 u  None
0x354 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8  0  0  0  0  8 1 u  None
0x355 24 dc  0  32  0 r  y .   8  8  8  8 .  s  0 24  8  0  0  0  0  8 1 u  None
0x356 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 24  8  0  0  0  0  8 1 u  None
0x357 24 dc  0  32  0 r  . .   8  8  8  8 .  s  0 24  8  0  0  0  0  8 1 u  None
0x358 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0  0  0  0  0  0  0  0 0 u  None
0x359 24 tc  0  24  0 r  y .   8  8  8  0 .  s  0  0  0  0  0  0  0  0 0 u  None
0x35a 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0  0  0  0  0  0  0  0 0 u  None
0x35b 24 tc  0  24  0 r  . .   8  8  8  0 .  s  0  0  0  0  0  0  0  0 0 u  None
0x35c 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0  0  0  0  0  0  0  0 0 u  None
0x35d 24 dc  0  24  0 r  y .   8  8  8  0 .  s  0  0  0  0  0  0  0  0 0 u  None
0x35e 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0  0  0  0  0  0  0  0 0 u  None
0x35f 24 dc  0  24  0 r  . .   8  8  8  0 .  s  0  0  0  0  0  0  0  0 0 u  None
0x360 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0  0  0  0  0  0 0 u  None
0x361 24 tc  0  24  0 r  y .   8  8  8  0 .  s  0 16  0  0  0  0  0  0 0 u  None
0x362 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 16  0  0  0  0  0  0 0 u  None
0x363 24 tc  0  24  0 r  . .   8  8  8  0 .  s  0 16  0  0  0  0  0  0 0 u  None
0x364 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0  0  0  0  0  0 0 u  None
0x365 24 dc  0  24  0 r  y .   8  8  8  0 .  s  0 16  0  0  0  0  0  0 0 u  None
0x366 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 16  0  0  0  0  0  0 0 u  None
0x367 24 dc  0  24  0 r  . .   8  8  8  0 .  s  0 16  0  0  0  0  0  0 0 u  None
0x368 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0  0  0  0  0  0 0 u  None
0x369 24 tc  0  24  0 r  y .   8  8  8  0 .  s  0 24  0  0  0  0  0  0 0 u  None
0x36a 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 24  0  0  0  0  0  0 0 u  None
0x36b 24 tc  0  24  0 r  . .   8  8  8  0 .  s  0 24  0  0  0  0  0  0 0 u  None
0x36c 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0  0  0  0  0  0 0 u  None
0x36d 24 dc  0  24  0 r  y .   8  8  8  0 .  s  0 24  0  0  0  0  0  0 0 u  None
0x36e 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 24  0  0  0  0  0  0 0 u  None
0x36f 24 dc  0  24  0 r  . .   8  8  8  0 .  s  0 24  0  0  0  0  0  0 0 u  None
0x370 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8  0  0  0  0  0 0 u  None
0x371 24 tc  0  24  0 r  y .   8  8  8  0 .  s  0 24  8  0  0  0  0  0 0 u  None
0x372 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 24  8  0  0  0  0  0 0 u  None
0x373 24 tc  0  24  0 r  . .   8  8  8  0 .  s  0 24  8  0  0  0  0  0 0 u  None
0x374 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8  0  0  0  0  0 0 u  None
0x375 24 dc  0  24  0 r  y .   8  8  8  0 .  s  0 24  8  0  0  0  0  0 0 u  None
0x376 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 24  8  0  0  0  0  0 0 u  None
0x377 24 dc  0  24  0 r  . .   8  8  8  0 .  s  0 24  8  0  0  0  0  0 0 u  None
0x378 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0  0  0  0  0  0  0  2 1 u  None
0x379 24 tc  0  24  0 r  y .   8  8  8  0 .  s  0  0  0  0  0  0  0  2 1 u  None
0x37a 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0  0  0  0  0  0  0  2 1 u  None
0x37b 24 tc  0  24  0 r  . .   8  8  8  0 .  s  0  0  0  0  0  0  0  2 1 u  None
0x37c 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0  0  0  0  0  0  0  2 1 u  None
0x37d 24 dc  0  24  0 r  y .   8  8  8  0 .  s  0  0  0  0  0  0  0  2 1 u  None
0x37e 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0  0  0  0  0  0  0  2 1 u  None
0x37f 24 dc  0  24  0 r  . .   8  8  8  0 .  s  0  0  0  0  0  0  0  2 1 u  None
0x380 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0  0  0  0  0  0  0  4 1 u  None
0x381 24 tc  0  24  0 r  y .   8  8  8  0 .  s  0  0  0  0  0  0  0  4 1 u  None
0x382 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0  0  0  0  0  0  0  4 1 u  None
0x383 24 tc  0  24  0 r  . .   8  8  8  0 .  s  0  0  0  0  0  0  0  4 1 u  None
0x384 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0  0  0  0  0  0  0  4 1 u  None
0x385 24 dc  0  24  0 r  y .   8  8  8  0 .  s  0  0  0  0  0  0  0  4 1 u  None
0x386 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0  0  0  0  0  0  0  4 1 u  None
0x387 24 dc  0  24  0 r  . .   8  8  8  0 .  s  0  0  0  0  0  0  0  4 1 u  None
0x388 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0  0  0  0  0  0  0  8 1 u  None
0x389 24 tc  0  24  0 r  y .   8  8  8  0 .  s  0  0  0  0  0  0  0  8 1 u  None
0x38a 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0  0  0  0  0  0  0  8 1 u  None
0x38b 24 tc  0  24  0 r  . .   8  8  8  0 .  s  0  0  0  0  0  0  0  8 1 u  None
0x38c 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0  0  0  0  0  0  0  8 1 u  None
0x38d 24 dc  0  24  0 r  y .   8  8  8  0 .  s  0  0  0  0  0  0  0  8 1 u  None
0x38e 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0  0  0  0  0  0  0  8 1 u  None
0x38f 24 dc  0  24  0 r  . .   8  8  8  0 .  s  0  0  0  0  0  0  0  8 1 u  None
0x390 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0  0  0  0  0  2 1 u  None
0x391 24 tc  0  24  0 r  y .   8  8  8  0 .  s  0 16  0  0  0  0  0  2 1 u  None
0x392 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 16  0  0  0  0  0  2 1 u  None
0x393 24 tc  0  24  0 r  . .   8  8  8  0 .  s  0 16  0  0  0  0  0  2 1 u  None
0x394 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0  0  0  0  0  2 1 u  None
0x395 24 dc  0  24  0 r  y .   8  8  8  0 .  s  0 16  0  0  0  0  0  2 1 u  None
0x396 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 16  0  0  0  0  0  2 1 u  None
0x397 24 dc  0  24  0 r  . .   8  8  8  0 .  s  0 16  0  0  0  0  0  2 1 u  None
0x398 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0  0  0  0  0  4 1 u  None
0x399 24 tc  0  24  0 r  y .   8  8  8  0 .  s  0 16  0  0  0  0  0  4 1 u  None
0x39a 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 16  0  0  0  0  0  4 1 u  None
0x39b 24 tc  0  24  0 r  . .   8  8  8  0 .  s  0 16  0  0  0  0  0  4 1 u  None
0x39c 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0  0  0  0  0  4 1 u  None
0x39d 24 dc  0  24  0 r  y .   8  8  8  0 .  s  0 16  0  0  0  0  0  4 1 u  None
0x39e 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 16  0  0  0  0  0  4 1 u  None
0x39f 24 dc  0  24  0 r  . .   8  8  8  0 .  s  0 16  0  0  0  0  0  4 1 u  None
0x3a0 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0  0  0  0  0  8 1 u  None
0x3a1 24 tc  0  24  0 r  y .   8  8  8  0 .  s  0 16  0  0  0  0  0  8 1 u  None
0x3a2 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 16  0  0  0  0  0  8 1 u  None
0x3a3 24 tc  0  24  0 r  . .   8  8  8  0 .  s  0 16  0  0  0  0  0  8 1 u  None
0x3a4 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0  0  0  0  0  8 1 u  None
0x3a5 24 dc  0  24  0 r  y .   8  8  8  0 .  s  0 16  0  0  0  0  0  8 1 u  None
0x3a6 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 16  0  0  0  0  0  8 1 u  None
0x3a7 24 dc  0  24  0 r  . .   8  8  8  0 .  s  0 16  0  0  0  0  0  8 1 u  None
0x3a8 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0  0  0  0  0  2 1 u  None
0x3a9 24 tc  0  24  0 r  y .   8  8  8  0 .  s  0 24  0  0  0  0  0  2 1 u  None
0x3aa 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 24  0  0  0  0  0  2 1 u  None
0x3ab 24 tc  0  24  0 r  . .   8  8  8  0 .  s  0 24  0  0  0  0  0  2 1 u  None
0x3ac 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0  0  0  0  0  2 1 u  None
0x3ad 24 dc  0  24  0 r  y .   8  8  8  0 .  s  0 24  0  0  0  0  0  2 1 u  None
0x3ae 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 24  0  0  0  0  0  2 1 u  None
0x3af 24 dc  0  24  0 r  . .   8  8  8  0 .  s  0 24  0  0  0  0  0  2 1 u  None
0x3b0 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0  0  0  0  0  4 1 u  None
0x3b1 24 tc  0  24  0 r  y .   8  8  8  0 .  s  0 24  0  0  0  0  0  4 1 u  None
0x3b2 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 24  0  0  0  0  0  4 1 u  None
0x3b3 24 tc  0  24  0 r  . .   8  8  8  0 .  s  0 24  0  0  0  0  0  4 1 u  None
0x3b4 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0  0  0  0  0  4 1 u  None
0x3b5 24 dc  0  24  0 r  y .   8  8  8  0 .  s  0 24  0  0  0  0  0  4 1 u  None
0x3b6 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 24  0  0  0  0  0  4 1 u  None
0x3b7 24 dc  0  24  0 r  . .   8  8  8  0 .  s  0 24  0  0  0  0  0  4 1 u  None
0x3b8 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0  0  0  0  0  8 1 u  None
0x3b9 24 tc  0  24  0 r  y .   8  8  8  0 .  s  0 24  0  0  0  0  0  8 1 u  None
0x3ba 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 24  0  0  0  0  0  8 1 u  None
0x3bb 24 tc  0  24  0 r  . .   8  8  8  0 .  s  0 24  0  0  0  0  0  8 1 u  None
0x3bc 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0  0  0  0  0  8 1 u  None
0x3bd 24 dc  0  24  0 r  y .   8  8  8  0 .  s  0 24  0  0  0  0  0  8 1 u  None
0x3be 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 24  0  0  0  0  0  8 1 u  None
0x3bf 24 dc  0  24  0 r  . .   8  8  8  0 .  s  0 24  0  0  0  0  0  8 1 u  None
0x3c0 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8  0  0  0  0  2 1 u  None
0x3c1 24 tc  0  24  0 r  y .   8  8  8  0 .  s  0 24  8  0  0  0  0  2 1 u  None
0x3c2 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 24  8  0  0  0  0  2 1 u  None
0x3c3 24 tc  0  24  0 r  . .   8  8  8  0 .  s  0 24  8  0  0  0  0  2 1 u  None
0x3c4 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8  0  0  0  0  2 1 u  None
0x3c5 24 dc  0  24  0 r  y .   8  8  8  0 .  s  0 24  8  0  0  0  0  2 1 u  None
0x3c6 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 24  8  0  0  0  0  2 1 u  None
0x3c7 24 dc  0  24  0 r  . .   8  8  8  0 .  s  0 24  8  0  0  0  0  2 1 u  None
0x3c8 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8  0  0  0  0  4 1 u  None
0x3c9 24 tc  0  24  0 r  y .   8  8  8  0 .  s  0 24  8  0  0  0  0  4 1 u  None
0x3ca 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 24  8  0  0  0  0  4 1 u  None
0x3cb 24 tc  0  24  0 r  . .   8  8  8  0 .  s  0 24  8  0  0  0  0  4 1 u  None
0x3cc 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8  0  0  0  0  4 1 u  None
0x3cd 24 dc  0  24  0 r  y .   8  8  8  0 .  s  0 24  8  0  0  0  0  4 1 u  None
0x3ce 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 24  8  0  0  0  0  4 1 u  None
0x3cf 24 dc  0  24  0 r  . .   8  8  8  0 .  s  0 24  8  0  0  0  0  4 1 u  None
0x3d0 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8  0  0  0  0  8 1 u  None
0x3d1 24 tc  0  24  0 r  y .   8  8  8  0 .  s  0 24  8  0  0  0  0  8 1 u  None
0x3d2 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 24  8  0  0  0  0  8 1 u  None
0x3d3 24 tc  0  24  0 r  . .   8  8  8  0 .  s  0 24  8  0  0  0  0  8 1 u  None
0x3d4 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8  0  0  0  0  8 1 u  None
0x3d5 24 dc  0  24  0 r  y .   8  8  8  0 .  s  0 24  8  0  0  0  0  8 1 u  None
0x3d6 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 24  8  0  0  0  0  8 1 u  None
0x3d7 24 dc  0  24  0 r  . .   8  8  8  0 .  s  0 24  8  0  0  0  0  8 1 u  None
0x07a 32 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8  0  0  0  0  0 0 u  None
0x2d3 32 tc  0  32  0 r  y .   8  8  8  8 .  .  0  0  0  0  0  0  0  0 0 u  None
0x2d4 32 tc  0  32  0 r  y .   8  8  8  8 .  s  0  0  0  0  0  0  0  0 0 u  None
0x2d5 32 tc  0  32  0 r  . .   8  8  8  8 .  .  0  0  0  0  0  0  0  0 0 u  None
0x2d6 32 tc  0  32  0 r  . .   8  8  8  8 .  s  0  0  0  0  0  0  0  0 0 u  None
0x2df 32 tc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0  0  0  0  0  0 0 u  None
0x2e0 32 tc  0  32  0 r  y .   8  8  8  8 .  s  0 16  0  0  0  0  0  0 0 u  None
0x2e1 32 tc  0  32  0 r  . .   8  8  8  8 .  .  0 16  0  0  0  0  0  0 0 u  None
0x2e2 32 tc  0  32  0 r  . .   8  8  8  8 .  s  0 16  0  0  0  0  0  0 0 u  None
0x2eb 32 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0  0  0  0  0  0 0 u  None
0x2ec 32 tc  0  32  0 r  y .   8  8  8  8 .  s  0 24  0  0  0  0  0  0 0 u  None
0x2ed 32 tc  0  32  0 r  . .   8  8  8  8 .  .  0 24  0  0  0  0  0  0 0 u  None
0x2ee 32 tc  0  32  0 r  . .   8  8  8  8 .  s  0 24  0  0  0  0  0  0 0 u  None
0x2f5 32 tc  0  32  0 r  y .   8  8  8  8 .  s  0 24  8  0  0  0  0  0 0 u  None
0x2f6 32 tc  0  32  0 r  . .   8  8  8  8 .  .  0 24  8  0  0  0  0  0 0 u  None
0x2f7 32 tc  0  32  0 r  . .   8  8  8  8 .  s  0 24  8  0  0  0  0  0 0 u  None

464 GLXFBConfigs:
    visual  x   bf lv rg d st  colorbuffer  sr ax dp st accumbuffer  ms  sw cav
  id dep cl sp  sz l  ci b ro  r  g  b  a F gb bf th cl  r  g  b  a ns b ap eat
----------------------------------------------------------------------------
0x07b  0 tc  0  32  0 r  y .  10 10 10  2 .  .  0  0  0  0  0  0  0  0 0 u  None
0x07c  0 tc  0  32  0 r  . .  10 10 10  2 .  .  0  0  0  0  0  0  0  0 0 u  None
0x07d  0 dc  0  32  0 r  y .  10 10 10  2 .  .  0  0  0  0  0  0  0  0 0 u  None
0x07e  0 dc  0  32  0 r  . .  10 10 10  2 .  .  0  0  0  0  0  0  0  0 0 u  None
0x07f  0 tc  0  32  0 r  y .  10 10 10  2 .  .  0 16  0  0  0  0  0  0 0 u  None
0x080  0 tc  0  32  0 r  . .  10 10 10  2 .  .  0 16  0  0  0  0  0  0 0 u  None
0x081  0 dc  0  32  0 r  y .  10 10 10  2 .  .  0 16  0  0  0  0  0  0 0 u  None
0x082  0 dc  0  32  0 r  . .  10 10 10  2 .  .  0 16  0  0  0  0  0  0 0 u  None
0x083  0 tc  0  32  0 r  y .  10 10 10  2 .  .  0 24  0  0  0  0  0  0 0 u  None
0x084  0 tc  0  32  0 r  . .  10 10 10  2 .  .  0 24  0  0  0  0  0  0 0 u  None
0x085  0 dc  0  32  0 r  y .  10 10 10  2 .  .  0 24  0  0  0  0  0  0 0 u  None
0x086  0 dc  0  32  0 r  . .  10 10 10  2 .  .  0 24  0  0  0  0  0  0 0 u  None
0x087  0 tc  0  32  0 r  y .  10 10 10  2 .  .  0 24  8  0  0  0  0  0 0 u  None
0x088  0 tc  0  32  0 r  . .  10 10 10  2 .  .  0 24  8  0  0  0  0  0 0 u  None
0x089  0 dc  0  32  0 r  y .  10 10 10  2 .  .  0 24  8  0  0  0  0  0 0 u  None
0x08a  0 dc  0  32  0 r  . .  10 10 10  2 .  .  0 24  8  0  0  0  0  0 0 u  None
0x08b  0 tc  0  32  0 r  y .  10 10 10  2 .  .  0  0  0  0  0  0  0  2 1 u  None
0x08c  0 tc  0  32  0 r  . .  10 10 10  2 .  .  0  0  0  0  0  0  0  2 1 u  None
0x08d  0 dc  0  32  0 r  y .  10 10 10  2 .  .  0  0  0  0  0  0  0  2 1 u  None
0x08e  0 dc  0  32  0 r  . .  10 10 10  2 .  .  0  0  0  0  0  0  0  2 1 u  None
0x08f  0 tc  0  32  0 r  y .  10 10 10  2 .  .  0  0  0  0  0  0  0  4 1 u  None
0x090  0 tc  0  32  0 r  . .  10 10 10  2 .  .  0  0  0  0  0  0  0  4 1 u  None
0x091  0 dc  0  32  0 r  y .  10 10 10  2 .  .  0  0  0  0  0  0  0  4 1 u  None
0x092  0 dc  0  32  0 r  . .  10 10 10  2 .  .  0  0  0  0  0  0  0  4 1 u  None
0x093  0 tc  0  32  0 r  y .  10 10 10  2 .  .  0  0  0  0  0  0  0  8 1 u  None
0x094  0 tc  0  32  0 r  . .  10 10 10  2 .  .  0  0  0  0  0  0  0  8 1 u  None
0x095  0 dc  0  32  0 r  y .  10 10 10  2 .  .  0  0  0  0  0  0  0  8 1 u  None
0x096  0 dc  0  32  0 r  . .  10 10 10  2 .  .  0  0  0  0  0  0  0  8 1 u  None
0x097  0 tc  0  32  0 r  y .  10 10 10  2 .  .  0 16  0  0  0  0  0  2 1 u  None
0x098  0 tc  0  32  0 r  . .  10 10 10  2 .  .  0 16  0  0  0  0  0  2 1 u  None
0x099  0 dc  0  32  0 r  y .  10 10 10  2 .  .  0 16  0  0  0  0  0  2 1 u  None
0x09a  0 dc  0  32  0 r  . .  10 10 10  2 .  .  0 16  0  0  0  0  0  2 1 u  None
0x09b  0 tc  0  32  0 r  y .  10 10 10  2 .  .  0 16  0  0  0  0  0  4 1 u  None
0x09c  0 tc  0  32  0 r  . .  10 10 10  2 .  .  0 16  0  0  0  0  0  4 1 u  None
0x09d  0 dc  0  32  0 r  y .  10 10 10  2 .  .  0 16  0  0  0  0  0  4 1 u  None
0x09e  0 dc  0  32  0 r  . .  10 10 10  2 .  .  0 16  0  0  0  0  0  4 1 u  None
0x09f  0 tc  0  32  0 r  y .  10 10 10  2 .  .  0 16  0  0  0  0  0  8 1 u  None
0x0a0  0 tc  0  32  0 r  . .  10 10 10  2 .  .  0 16  0  0  0  0  0  8 1 u  None
0x0a1  0 dc  0  32  0 r  y .  10 10 10  2 .  .  0 16  0  0  0  0  0  8 1 u  None
0x0a2  0 dc  0  32  0 r  . .  10 10 10  2 .  .  0 16  0  0  0  0  0  8 1 u  None
0x0a3  0 tc  0  32  0 r  y .  10 10 10  2 .  .  0 24  0  0  0  0  0  2 1 u  None
0x0a4  0 tc  0  32  0 r  . .  10 10 10  2 .  .  0 24  0  0  0  0  0  2 1 u  None
0x0a5  0 dc  0  32  0 r  y .  10 10 10  2 .  .  0 24  0  0  0  0  0  2 1 u  None
0x0a6  0 dc  0  32  0 r  . .  10 10 10  2 .  .  0 24  0  0  0  0  0  2 1 u  None
0x0a7  0 tc  0  32  0 r  y .  10 10 10  2 .  .  0 24  0  0  0  0  0  4 1 u  None
0x0a8  0 tc  0  32  0 r  . .  10 10 10  2 .  .  0 24  0  0  0  0  0  4 1 u  None
0x0a9  0 dc  0  32  0 r  y .  10 10 10  2 .  .  0 24  0  0  0  0  0  4 1 u  None
0x0aa  0 dc  0  32  0 r  . .  10 10 10  2 .  .  0 24  0  0  0  0  0  4 1 u  None
0x0ab  0 tc  0  32  0 r  y .  10 10 10  2 .  .  0 24  0  0  0  0  0  8 1 u  None
0x0ac  0 tc  0  32  0 r  . .  10 10 10  2 .  .  0 24  0  0  0  0  0  8 1 u  None
0x0ad  0 dc  0  32  0 r  y .  10 10 10  2 .  .  0 24  0  0  0  0  0  8 1 u  None
0x0ae  0 dc  0  32  0 r  . .  10 10 10  2 .  .  0 24  0  0  0  0  0  8 1 u  None
0x0af  0 tc  0  32  0 r  y .  10 10 10  2 .  .  0 24  8  0  0  0  0  2 1 u  None
0x0b0  0 tc  0  32  0 r  . .  10 10 10  2 .  .  0 24  8  0  0  0  0  2 1 u  None
0x0b1  0 dc  0  32  0 r  y .  10 10 10  2 .  .  0 24  8  0  0  0  0  2 1 u  None
0x0b2  0 dc  0  32  0 r  . .  10 10 10  2 .  .  0 24  8  0  0  0  0  2 1 u  None
0x0b3  0 tc  0  32  0 r  y .  10 10 10  2 .  .  0 24  8  0  0  0  0  4 1 u  None
0x0b4  0 tc  0  32  0 r  . .  10 10 10  2 .  .  0 24  8  0  0  0  0  4 1 u  None
0x0b5  0 dc  0  32  0 r  y .  10 10 10  2 .  .  0 24  8  0  0  0  0  4 1 u  None
0x0b6  0 dc  0  32  0 r  . .  10 10 10  2 .  .  0 24  8  0  0  0  0  4 1 u  None
0x0b7  0 tc  0  32  0 r  y .  10 10 10  2 .  .  0 24  8  0  0  0  0  8 1 u  None
0x0b8  0 tc  0  32  0 r  . .  10 10 10  2 .  .  0 24  8  0  0  0  0  8 1 u  None
0x0b9  0 dc  0  32  0 r  y .  10 10 10  2 .  .  0 24  8  0  0  0  0  8 1 u  None
0x0ba  0 dc  0  32  0 r  . .  10 10 10  2 .  .  0 24  8  0  0  0  0  8 1 u  None
0x0bb  0 tc  0  30  0 r  y .  10 10 10  0 .  .  0  0  0  0  0  0  0  0 0 u  None
0x0bc  0 tc  0  30  0 r  . .  10 10 10  0 .  .  0  0  0  0  0  0  0  0 0 u  None
0x0bd  0 dc  0  30  0 r  y .  10 10 10  0 .  .  0  0  0  0  0  0  0  0 0 u  None
0x0be  0 dc  0  30  0 r  . .  10 10 10  0 .  .  0  0  0  0  0  0  0  0 0 u  None
0x0bf  0 tc  0  30  0 r  y .  10 10 10  0 .  .  0 16  0  0  0  0  0  0 0 u  None
0x0c0  0 tc  0  30  0 r  . .  10 10 10  0 .  .  0 16  0  0  0  0  0  0 0 u  None
0x0c1  0 dc  0  30  0 r  y .  10 10 10  0 .  .  0 16  0  0  0  0  0  0 0 u  None
0x0c2  0 dc  0  30  0 r  . .  10 10 10  0 .  .  0 16  0  0  0  0  0  0 0 u  None
0x0c3  0 tc  0  30  0 r  y .  10 10 10  0 .  .  0 24  0  0  0  0  0  0 0 u  None
0x0c4  0 tc  0  30  0 r  . .  10 10 10  0 .  .  0 24  0  0  0  0  0  0 0 u  None
0x0c5  0 dc  0  30  0 r  y .  10 10 10  0 .  .  0 24  0  0  0  0  0  0 0 u  None
0x0c6  0 dc  0  30  0 r  . .  10 10 10  0 .  .  0 24  0  0  0  0  0  0 0 u  None
0x0c7  0 tc  0  30  0 r  y .  10 10 10  0 .  .  0 24  8  0  0  0  0  0 0 u  None
0x0c8  0 tc  0  30  0 r  . .  10 10 10  0 .  .  0 24  8  0  0  0  0  0 0 u  None
0x0c9  0 dc  0  30  0 r  y .  10 10 10  0 .  .  0 24  8  0  0  0  0  0 0 u  None
0x0ca  0 dc  0  30  0 r  . .  10 10 10  0 .  .  0 24  8  0  0  0  0  0 0 u  None
0x0cb  0 tc  0  30  0 r  y .  10 10 10  0 .  .  0  0  0  0  0  0  0  2 1 u  None
0x0cc  0 tc  0  30  0 r  . .  10 10 10  0 .  .  0  0  0  0  0  0  0  2 1 u  None
0x0cd  0 dc  0  30  0 r  y .  10 10 10  0 .  .  0  0  0  0  0  0  0  2 1 u  None
0x0ce  0 dc  0  30  0 r  . .  10 10 10  0 .  .  0  0  0  0  0  0  0  2 1 u  None
0x0cf  0 tc  0  30  0 r  y .  10 10 10  0 .  .  0  0  0  0  0  0  0  4 1 u  None
0x0d0  0 tc  0  30  0 r  . .  10 10 10  0 .  .  0  0  0  0  0  0  0  4 1 u  None
0x0d1  0 dc  0  30  0 r  y .  10 10 10  0 .  .  0  0  0  0  0  0  0  4 1 u  None
0x0d2  0 dc  0  30  0 r  . .  10 10 10  0 .  .  0  0  0  0  0  0  0  4 1 u  None
0x0d3  0 tc  0  30  0 r  y .  10 10 10  0 .  .  0  0  0  0  0  0  0  8 1 u  None
0x0d4  0 tc  0  30  0 r  . .  10 10 10  0 .  .  0  0  0  0  0  0  0  8 1 u  None
0x0d5  0 dc  0  30  0 r  y .  10 10 10  0 .  .  0  0  0  0  0  0  0  8 1 u  None
0x0d6  0 dc  0  30  0 r  . .  10 10 10  0 .  .  0  0  0  0  0  0  0  8 1 u  None
0x0d7  0 tc  0  30  0 r  y .  10 10 10  0 .  .  0 16  0  0  0  0  0  2 1 u  None
0x0d8  0 tc  0  30  0 r  . .  10 10 10  0 .  .  0 16  0  0  0  0  0  2 1 u  None
0x0d9  0 dc  0  30  0 r  y .  10 10 10  0 .  .  0 16  0  0  0  0  0  2 1 u  None
0x0da  0 dc  0  30  0 r  . .  10 10 10  0 .  .  0 16  0  0  0  0  0  2 1 u  None
0x0db  0 tc  0  30  0 r  y .  10 10 10  0 .  .  0 16  0  0  0  0  0  4 1 u  None
0x0dc  0 tc  0  30  0 r  . .  10 10 10  0 .  .  0 16  0  0  0  0  0  4 1 u  None
0x0dd  0 dc  0  30  0 r  y .  10 10 10  0 .  .  0 16  0  0  0  0  0  4 1 u  None
0x0de  0 dc  0  30  0 r  . .  10 10 10  0 .  .  0 16  0  0  0  0  0  4 1 u  None
0x0df  0 tc  0  30  0 r  y .  10 10 10  0 .  .  0 16  0  0  0  0  0  8 1 u  None
0x0e0  0 tc  0  30  0 r  . .  10 10 10  0 .  .  0 16  0  0  0  0  0  8 1 u  None
0x0e1  0 dc  0  30  0 r  y .  10 10 10  0 .  .  0 16  0  0  0  0  0  8 1 u  None
0x0e2  0 dc  0  30  0 r  . .  10 10 10  0 .  .  0 16  0  0  0  0  0  8 1 u  None
0x0e3  0 tc  0  30  0 r  y .  10 10 10  0 .  .  0 24  0  0  0  0  0  2 1 u  None
0x0e4  0 tc  0  30  0 r  . .  10 10 10  0 .  .  0 24  0  0  0  0  0  2 1 u  None
0x0e5  0 dc  0  30  0 r  y .  10 10 10  0 .  .  0 24  0  0  0  0  0  2 1 u  None
0x0e6  0 dc  0  30  0 r  . .  10 10 10  0 .  .  0 24  0  0  0  0  0  2 1 u  None
0x0e7  0 tc  0  30  0 r  y .  10 10 10  0 .  .  0 24  0  0  0  0  0  4 1 u  None
0x0e8  0 tc  0  30  0 r  . .  10 10 10  0 .  .  0 24  0  0  0  0  0  4 1 u  None
0x0e9  0 dc  0  30  0 r  y .  10 10 10  0 .  .  0 24  0  0  0  0  0  4 1 u  None
0x0ea  0 dc  0  30  0 r  . .  10 10 10  0 .  .  0 24  0  0  0  0  0  4 1 u  None
0x0eb  0 tc  0  30  0 r  y .  10 10 10  0 .  .  0 24  0  0  0  0  0  8 1 u  None
0x0ec  0 tc  0  30  0 r  . .  10 10 10  0 .  .  0 24  0  0  0  0  0  8 1 u  None
0x0ed  0 dc  0  30  0 r  y .  10 10 10  0 .  .  0 24  0  0  0  0  0  8 1 u  None
0x0ee  0 dc  0  30  0 r  . .  10 10 10  0 .  .  0 24  0  0  0  0  0  8 1 u  None
0x0ef  0 tc  0  30  0 r  y .  10 10 10  0 .  .  0 24  8  0  0  0  0  2 1 u  None
0x0f0  0 tc  0  30  0 r  . .  10 10 10  0 .  .  0 24  8  0  0  0  0  2 1 u  None
0x0f1  0 dc  0  30  0 r  y .  10 10 10  0 .  .  0 24  8  0  0  0  0  2 1 u  None
0x0f2  0 dc  0  30  0 r  . .  10 10 10  0 .  .  0 24  8  0  0  0  0  2 1 u  None
0x0f3  0 tc  0  30  0 r  y .  10 10 10  0 .  .  0 24  8  0  0  0  0  4 1 u  None
0x0f4  0 tc  0  30  0 r  . .  10 10 10  0 .  .  0 24  8  0  0  0  0  4 1 u  None
0x0f5  0 dc  0  30  0 r  y .  10 10 10  0 .  .  0 24  8  0  0  0  0  4 1 u  None
0x0f6  0 dc  0  30  0 r  . .  10 10 10  0 .  .  0 24  8  0  0  0  0  4 1 u  None
0x0f7  0 tc  0  30  0 r  y .  10 10 10  0 .  .  0 24  8  0  0  0  0  8 1 u  None
0x0f8  0 tc  0  30  0 r  . .  10 10 10  0 .  .  0 24  8  0  0  0  0  8 1 u  None
0x0f9  0 dc  0  30  0 r  y .  10 10 10  0 .  .  0 24  8  0  0  0  0  8 1 u  None
0x0fa  0 dc  0  30  0 r  . .  10 10 10  0 .  .  0 24  8  0  0  0  0  8 1 u  None
0x0fb 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0  0  0  0  0  0  0  0 0 u  None
0x0fc 24 tc  0  32  0 r  y .   8  8  8  8 .  s  0  0  0  0  0  0  0  0 0 u  None
0x0fd 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0  0  0  0  0  0  0  0 0 u  None
0x0fe 24 tc  0  32  0 r  . .   8  8  8  8 .  s  0  0  0  0  0  0  0  0 0 u  None
0x0ff 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0  0  0  0  0  0  0  0 0 u  None
0x100 24 dc  0  32  0 r  y .   8  8  8  8 .  s  0  0  0  0  0  0  0  0 0 u  None
0x101 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0  0  0  0  0  0  0  0 0 u  None
0x102 24 dc  0  32  0 r  . .   8  8  8  8 .  s  0  0  0  0  0  0  0  0 0 u  None
0x103 32 tc  0  32  0 r  y .   8  8  8  8 .  .  0  0  0  0  0  0  0  0 0 u  None
0x104 32 tc  0  32  0 r  y .   8  8  8  8 .  s  0  0  0  0  0  0  0  0 0 u  None
0x105 32 tc  0  32  0 r  . .   8  8  8  8 .  .  0  0  0  0  0  0  0  0 0 u  None
0x106 32 tc  0  32  0 r  . .   8  8  8  8 .  s  0  0  0  0  0  0  0  0 0 u  None
0x107 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0  0  0  0  0  0 0 u  None
0x108 24 tc  0  32  0 r  y .   8  8  8  8 .  s  0 16  0  0  0  0  0  0 0 u  None
0x109 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 16  0  0  0  0  0  0 0 u  None
0x10a 24 tc  0  32  0 r  . .   8  8  8  8 .  s  0 16  0  0  0  0  0  0 0 u  None
0x10b 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0  0  0  0  0  0 0 u  None
0x10c 24 dc  0  32  0 r  y .   8  8  8  8 .  s  0 16  0  0  0  0  0  0 0 u  None
0x10d 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 16  0  0  0  0  0  0 0 u  None
0x10e 24 dc  0  32  0 r  . .   8  8  8  8 .  s  0 16  0  0  0  0  0  0 0 u  None
0x10f 32 tc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0  0  0  0  0  0 0 u  None
0x110 32 tc  0  32  0 r  y .   8  8  8  8 .  s  0 16  0  0  0  0  0  0 0 u  None
0x111 32 tc  0  32  0 r  . .   8  8  8  8 .  .  0 16  0  0  0  0  0  0 0 u  None
0x112 32 tc  0  32  0 r  . .   8  8  8  8 .  s  0 16  0  0  0  0  0  0 0 u  None
0x113 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0  0  0  0  0  0 0 u  None
0x114 24 tc  0  32  0 r  y .   8  8  8  8 .  s  0 24  0  0  0  0  0  0 0 u  None
0x115 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 24  0  0  0  0  0  0 0 u  None
0x116 24 tc  0  32  0 r  . .   8  8  8  8 .  s  0 24  0  0  0  0  0  0 0 u  None
0x117 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0  0  0  0  0  0 0 u  None
0x118 24 dc  0  32  0 r  y .   8  8  8  8 .  s  0 24  0  0  0  0  0  0 0 u  None
0x119 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 24  0  0  0  0  0  0 0 u  None
0x11a 24 dc  0  32  0 r  . .   8  8  8  8 .  s  0 24  0  0  0  0  0  0 0 u  None
0x11b 32 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0  0  0  0  0  0 0 u  None
0x11c 32 tc  0  32  0 r  y .   8  8  8  8 .  s  0 24  0  0  0  0  0  0 0 u  None
0x11d 32 tc  0  32  0 r  . .   8  8  8  8 .  .  0 24  0  0  0  0  0  0 0 u  None
0x11e 32 tc  0  32  0 r  . .   8  8  8  8 .  s  0 24  0  0  0  0  0  0 0 u  None
0x11f 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8  0  0  0  0  0 0 u  None
0x120 24 tc  0  32  0 r  y .   8  8  8  8 .  s  0 24  8  0  0  0  0  0 0 u  None
0x121 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 24  8  0  0  0  0  0 0 u  None
0x122 24 tc  0  32  0 r  . .   8  8  8  8 .  s  0 24  8  0  0  0  0  0 0 u  None
0x123 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8  0  0  0  0  0 0 u  None
0x124 24 dc  0  32  0 r  y .   8  8  8  8 .  s  0 24  8  0  0  0  0  0 0 u  None
0x125 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 24  8  0  0  0  0  0 0 u  None
0x126 24 dc  0  32  0 r  . .   8  8  8  8 .  s  0 24  8  0  0  0  0  0 0 u  None
0x127 32 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8  0  0  0  0  0 0 u  None
0x128 32 tc  0  32  0 r  y .   8  8  8  8 .  s  0 24  8  0  0  0  0  0 0 u  None
0x129 32 tc  0  32  0 r  . .   8  8  8  8 .  .  0 24  8  0  0  0  0  0 0 u  None
0x12a 32 tc  0  32  0 r  . .   8  8  8  8 .  s  0 24  8  0  0  0  0  0 0 u  None
0x12b 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0  0  0  0  0  0  0  2 1 u  None
0x12c 24 tc  0  32  0 r  y .   8  8  8  8 .  s  0  0  0  0  0  0  0  2 1 u  None
0x12d 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0  0  0  0  0  0  0  2 1 u  None
0x12e 24 tc  0  32  0 r  . .   8  8  8  8 .  s  0  0  0  0  0  0  0  2 1 u  None
0x12f 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0  0  0  0  0  0  0  2 1 u  None
0x130 24 dc  0  32  0 r  y .   8  8  8  8 .  s  0  0  0  0  0  0  0  2 1 u  None
0x131 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0  0  0  0  0  0  0  2 1 u  None
0x132 24 dc  0  32  0 r  . .   8  8  8  8 .  s  0  0  0  0  0  0  0  2 1 u  None
0x133 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0  0  0  0  0  0  0  4 1 u  None
0x134 24 tc  0  32  0 r  y .   8  8  8  8 .  s  0  0  0  0  0  0  0  4 1 u  None
0x135 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0  0  0  0  0  0  0  4 1 u  None
0x136 24 tc  0  32  0 r  . .   8  8  8  8 .  s  0  0  0  0  0  0  0  4 1 u  None
0x137 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0  0  0  0  0  0  0  4 1 u  None
0x138 24 dc  0  32  0 r  y .   8  8  8  8 .  s  0  0  0  0  0  0  0  4 1 u  None
0x139 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0  0  0  0  0  0  0  4 1 u  None
0x13a 24 dc  0  32  0 r  . .   8  8  8  8 .  s  0  0  0  0  0  0  0  4 1 u  None
0x13b 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0  0  0  0  0  0  0  8 1 u  None
0x13c 24 tc  0  32  0 r  y .   8  8  8  8 .  s  0  0  0  0  0  0  0  8 1 u  None
0x13d 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0  0  0  0  0  0  0  8 1 u  None
0x13e 24 tc  0  32  0 r  . .   8  8  8  8 .  s  0  0  0  0  0  0  0  8 1 u  None
0x13f 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0  0  0  0  0  0  0  8 1 u  None
0x140 24 dc  0  32  0 r  y .   8  8  8  8 .  s  0  0  0  0  0  0  0  8 1 u  None
0x141 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0  0  0  0  0  0  0  8 1 u  None
0x142 24 dc  0  32  0 r  . .   8  8  8  8 .  s  0  0  0  0  0  0  0  8 1 u  None
0x143 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0  0  0  0  0  2 1 u  None
0x144 24 tc  0  32  0 r  y .   8  8  8  8 .  s  0 16  0  0  0  0  0  2 1 u  None
0x145 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 16  0  0  0  0  0  2 1 u  None
0x146 24 tc  0  32  0 r  . .   8  8  8  8 .  s  0 16  0  0  0  0  0  2 1 u  None
0x147 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0  0  0  0  0  2 1 u  None
0x148 24 dc  0  32  0 r  y .   8  8  8  8 .  s  0 16  0  0  0  0  0  2 1 u  None
0x149 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 16  0  0  0  0  0  2 1 u  None
0x14a 24 dc  0  32  0 r  . .   8  8  8  8 .  s  0 16  0  0  0  0  0  2 1 u  None
0x14b 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0  0  0  0  0  4 1 u  None
0x14c 24 tc  0  32  0 r  y .   8  8  8  8 .  s  0 16  0  0  0  0  0  4 1 u  None
0x14d 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 16  0  0  0  0  0  4 1 u  None
0x14e 24 tc  0  32  0 r  . .   8  8  8  8 .  s  0 16  0  0  0  0  0  4 1 u  None
0x14f 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0  0  0  0  0  4 1 u  None
0x150 24 dc  0  32  0 r  y .   8  8  8  8 .  s  0 16  0  0  0  0  0  4 1 u  None
0x151 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 16  0  0  0  0  0  4 1 u  None
0x152 24 dc  0  32  0 r  . .   8  8  8  8 .  s  0 16  0  0  0  0  0  4 1 u  None
0x153 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0  0  0  0  0  8 1 u  None
0x154 24 tc  0  32  0 r  y .   8  8  8  8 .  s  0 16  0  0  0  0  0  8 1 u  None
0x155 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 16  0  0  0  0  0  8 1 u  None
0x156 24 tc  0  32  0 r  . .   8  8  8  8 .  s  0 16  0  0  0  0  0  8 1 u  None
0x157 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0  0  0  0  0  8 1 u  None
0x158 24 dc  0  32  0 r  y .   8  8  8  8 .  s  0 16  0  0  0  0  0  8 1 u  None
0x159 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 16  0  0  0  0  0  8 1 u  None
0x15a 24 dc  0  32  0 r  . .   8  8  8  8 .  s  0 16  0  0  0  0  0  8 1 u  None
0x15b 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0  0  0  0  0  2 1 u  None
0x15c 24 tc  0  32  0 r  y .   8  8  8  8 .  s  0 24  0  0  0  0  0  2 1 u  None
0x15d 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 24  0  0  0  0  0  2 1 u  None
0x15e 24 tc  0  32  0 r  . .   8  8  8  8 .  s  0 24  0  0  0  0  0  2 1 u  None
0x15f 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0  0  0  0  0  2 1 u  None
0x160 24 dc  0  32  0 r  y .   8  8  8  8 .  s  0 24  0  0  0  0  0  2 1 u  None
0x161 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 24  0  0  0  0  0  2 1 u  None
0x162 24 dc  0  32  0 r  . .   8  8  8  8 .  s  0 24  0  0  0  0  0  2 1 u  None
0x163 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0  0  0  0  0  4 1 u  None
0x164 24 tc  0  32  0 r  y .   8  8  8  8 .  s  0 24  0  0  0  0  0  4 1 u  None
0x165 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 24  0  0  0  0  0  4 1 u  None
0x166 24 tc  0  32  0 r  . .   8  8  8  8 .  s  0 24  0  0  0  0  0  4 1 u  None
0x167 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0  0  0  0  0  4 1 u  None
0x168 24 dc  0  32  0 r  y .   8  8  8  8 .  s  0 24  0  0  0  0  0  4 1 u  None
0x169 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 24  0  0  0  0  0  4 1 u  None
0x16a 24 dc  0  32  0 r  . .   8  8  8  8 .  s  0 24  0  0  0  0  0  4 1 u  None
0x16b 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0  0  0  0  0  8 1 u  None
0x16c 24 tc  0  32  0 r  y .   8  8  8  8 .  s  0 24  0  0  0  0  0  8 1 u  None
0x16d 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 24  0  0  0  0  0  8 1 u  None
0x16e 24 tc  0  32  0 r  . .   8  8  8  8 .  s  0 24  0  0  0  0  0  8 1 u  None
0x16f 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0  0  0  0  0  8 1 u  None
0x170 24 dc  0  32  0 r  y .   8  8  8  8 .  s  0 24  0  0  0  0  0  8 1 u  None
0x171 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 24  0  0  0  0  0  8 1 u  None
0x172 24 dc  0  32  0 r  . .   8  8  8  8 .  s  0 24  0  0  0  0  0  8 1 u  None
0x173 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8  0  0  0  0  2 1 u  None
0x174 24 tc  0  32  0 r  y .   8  8  8  8 .  s  0 24  8  0  0  0  0  2 1 u  None
0x175 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 24  8  0  0  0  0  2 1 u  None
0x176 24 tc  0  32  0 r  . .   8  8  8  8 .  s  0 24  8  0  0  0  0  2 1 u  None
0x177 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8  0  0  0  0  2 1 u  None
0x178 24 dc  0  32  0 r  y .   8  8  8  8 .  s  0 24  8  0  0  0  0  2 1 u  None
0x179 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 24  8  0  0  0  0  2 1 u  None
0x17a 24 dc  0  32  0 r  . .   8  8  8  8 .  s  0 24  8  0  0  0  0  2 1 u  None
0x17b 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8  0  0  0  0  4 1 u  None
0x17c 24 tc  0  32  0 r  y .   8  8  8  8 .  s  0 24  8  0  0  0  0  4 1 u  None
0x17d 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 24  8  0  0  0  0  4 1 u  None
0x17e 24 tc  0  32  0 r  . .   8  8  8  8 .  s  0 24  8  0  0  0  0  4 1 u  None
0x17f 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8  0  0  0  0  4 1 u  None
0x180 24 dc  0  32  0 r  y .   8  8  8  8 .  s  0 24  8  0  0  0  0  4 1 u  None
0x181 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 24  8  0  0  0  0  4 1 u  None
0x182 24 dc  0  32  0 r  . .   8  8  8  8 .  s  0 24  8  0  0  0  0  4 1 u  None
0x183 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8  0  0  0  0  8 1 u  None
0x184 24 tc  0  32  0 r  y .   8  8  8  8 .  s  0 24  8  0  0  0  0  8 1 u  None
0x185 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 24  8  0  0  0  0  8 1 u  None
0x186 24 tc  0  32  0 r  . .   8  8  8  8 .  s  0 24  8  0  0  0  0  8 1 u  None
0x187 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8  0  0  0  0  8 1 u  None
0x188 24 dc  0  32  0 r  y .   8  8  8  8 .  s  0 24  8  0  0  0  0  8 1 u  None
0x189 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 24  8  0  0  0  0  8 1 u  None
0x18a 24 dc  0  32  0 r  . .   8  8  8  8 .  s  0 24  8  0  0  0  0  8 1 u  None
0x18b 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0  0  0  0  0  0  0  0 0 u  None
0x18c 24 tc  0  24  0 r  y .   8  8  8  0 .  s  0  0  0  0  0  0  0  0 0 u  None
0x18d 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0  0  0  0  0  0  0  0 0 u  None
0x18e 24 tc  0  24  0 r  . .   8  8  8  0 .  s  0  0  0  0  0  0  0  0 0 u  None
0x18f 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0  0  0  0  0  0  0  0 0 u  None
0x190 24 dc  0  24  0 r  y .   8  8  8  0 .  s  0  0  0  0  0  0  0  0 0 u  None
0x191 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0  0  0  0  0  0  0  0 0 u  None
0x192 24 dc  0  24  0 r  . .   8  8  8  0 .  s  0  0  0  0  0  0  0  0 0 u  None
0x193 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0  0  0  0  0  0 0 u  None
0x194 24 tc  0  24  0 r  y .   8  8  8  0 .  s  0 16  0  0  0  0  0  0 0 u  None
0x195 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 16  0  0  0  0  0  0 0 u  None
0x196 24 tc  0  24  0 r  . .   8  8  8  0 .  s  0 16  0  0  0  0  0  0 0 u  None
0x197 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0  0  0  0  0  0 0 u  None
0x198 24 dc  0  24  0 r  y .   8  8  8  0 .  s  0 16  0  0  0  0  0  0 0 u  None
0x199 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 16  0  0  0  0  0  0 0 u  None
0x19a 24 dc  0  24  0 r  . .   8  8  8  0 .  s  0 16  0  0  0  0  0  0 0 u  None
0x19b 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0  0  0  0  0  0 0 u  None
0x19c 24 tc  0  24  0 r  y .   8  8  8  0 .  s  0 24  0  0  0  0  0  0 0 u  None
0x19d 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 24  0  0  0  0  0  0 0 u  None
0x19e 24 tc  0  24  0 r  . .   8  8  8  0 .  s  0 24  0  0  0  0  0  0 0 u  None
0x19f 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0  0  0  0  0  0 0 u  None
0x1a0 24 dc  0  24  0 r  y .   8  8  8  0 .  s  0 24  0  0  0  0  0  0 0 u  None
0x1a1 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 24  0  0  0  0  0  0 0 u  None
0x1a2 24 dc  0  24  0 r  . .   8  8  8  0 .  s  0 24  0  0  0  0  0  0 0 u  None
0x1a3 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8  0  0  0  0  0 0 u  None
0x1a4 24 tc  0  24  0 r  y .   8  8  8  0 .  s  0 24  8  0  0  0  0  0 0 u  None
0x1a5 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 24  8  0  0  0  0  0 0 u  None
0x1a6 24 tc  0  24  0 r  . .   8  8  8  0 .  s  0 24  8  0  0  0  0  0 0 u  None
0x1a7 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8  0  0  0  0  0 0 u  None
0x1a8 24 dc  0  24  0 r  y .   8  8  8  0 .  s  0 24  8  0  0  0  0  0 0 u  None
0x1a9 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 24  8  0  0  0  0  0 0 u  None
0x1aa 24 dc  0  24  0 r  . .   8  8  8  0 .  s  0 24  8  0  0  0  0  0 0 u  None
0x1ab 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0  0  0  0  0  0  0  2 1 u  None
0x1ac 24 tc  0  24  0 r  y .   8  8  8  0 .  s  0  0  0  0  0  0  0  2 1 u  None
0x1ad 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0  0  0  0  0  0  0  2 1 u  None
0x1ae 24 tc  0  24  0 r  . .   8  8  8  0 .  s  0  0  0  0  0  0  0  2 1 u  None
0x1af 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0  0  0  0  0  0  0  2 1 u  None
0x1b0 24 dc  0  24  0 r  y .   8  8  8  0 .  s  0  0  0  0  0  0  0  2 1 u  None
0x1b1 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0  0  0  0  0  0  0  2 1 u  None
0x1b2 24 dc  0  24  0 r  . .   8  8  8  0 .  s  0  0  0  0  0  0  0  2 1 u  None
0x1b3 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0  0  0  0  0  0  0  4 1 u  None
0x1b4 24 tc  0  24  0 r  y .   8  8  8  0 .  s  0  0  0  0  0  0  0  4 1 u  None
0x1b5 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0  0  0  0  0  0  0  4 1 u  None
0x1b6 24 tc  0  24  0 r  . .   8  8  8  0 .  s  0  0  0  0  0  0  0  4 1 u  None
0x1b7 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0  0  0  0  0  0  0  4 1 u  None
0x1b8 24 dc  0  24  0 r  y .   8  8  8  0 .  s  0  0  0  0  0  0  0  4 1 u  None
0x1b9 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0  0  0  0  0  0  0  4 1 u  None
0x1ba 24 dc  0  24  0 r  . .   8  8  8  0 .  s  0  0  0  0  0  0  0  4 1 u  None
0x1bb 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0  0  0  0  0  0  0  8 1 u  None
0x1bc 24 tc  0  24  0 r  y .   8  8  8  0 .  s  0  0  0  0  0  0  0  8 1 u  None
0x1bd 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0  0  0  0  0  0  0  8 1 u  None
0x1be 24 tc  0  24  0 r  . .   8  8  8  0 .  s  0  0  0  0  0  0  0  8 1 u  None
0x1bf 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0  0  0  0  0  0  0  8 1 u  None
0x1c0 24 dc  0  24  0 r  y .   8  8  8  0 .  s  0  0  0  0  0  0  0  8 1 u  None
0x1c1 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0  0  0  0  0  0  0  8 1 u  None
0x1c2 24 dc  0  24  0 r  . .   8  8  8  0 .  s  0  0  0  0  0  0  0  8 1 u  None
0x1c3 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0  0  0  0  0  2 1 u  None
0x1c4 24 tc  0  24  0 r  y .   8  8  8  0 .  s  0 16  0  0  0  0  0  2 1 u  None
0x1c5 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 16  0  0  0  0  0  2 1 u  None
0x1c6 24 tc  0  24  0 r  . .   8  8  8  0 .  s  0 16  0  0  0  0  0  2 1 u  None
0x1c7 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0  0  0  0  0  2 1 u  None
0x1c8 24 dc  0  24  0 r  y .   8  8  8  0 .  s  0 16  0  0  0  0  0  2 1 u  None
0x1c9 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 16  0  0  0  0  0  2 1 u  None
0x1ca 24 dc  0  24  0 r  . .   8  8  8  0 .  s  0 16  0  0  0  0  0  2 1 u  None
0x1cb 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0  0  0  0  0  4 1 u  None
0x1cc 24 tc  0  24  0 r  y .   8  8  8  0 .  s  0 16  0  0  0  0  0  4 1 u  None
0x1cd 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 16  0  0  0  0  0  4 1 u  None
0x1ce 24 tc  0  24  0 r  . .   8  8  8  0 .  s  0 16  0  0  0  0  0  4 1 u  None
0x1cf 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0  0  0  0  0  4 1 u  None
0x1d0 24 dc  0  24  0 r  y .   8  8  8  0 .  s  0 16  0  0  0  0  0  4 1 u  None
0x1d1 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 16  0  0  0  0  0  4 1 u  None
0x1d2 24 dc  0  24  0 r  . .   8  8  8  0 .  s  0 16  0  0  0  0  0  4 1 u  None
0x1d3 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0  0  0  0  0  8 1 u  None
0x1d4 24 tc  0  24  0 r  y .   8  8  8  0 .  s  0 16  0  0  0  0  0  8 1 u  None
0x1d5 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 16  0  0  0  0  0  8 1 u  None
0x1d6 24 tc  0  24  0 r  . .   8  8  8  0 .  s  0 16  0  0  0  0  0  8 1 u  None
0x1d7 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0  0  0  0  0  8 1 u  None
0x1d8 24 dc  0  24  0 r  y .   8  8  8  0 .  s  0 16  0  0  0  0  0  8 1 u  None
0x1d9 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 16  0  0  0  0  0  8 1 u  None
0x1da 24 dc  0  24  0 r  . .   8  8  8  0 .  s  0 16  0  0  0  0  0  8 1 u  None
0x1db 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0  0  0  0  0  2 1 u  None
0x1dc 24 tc  0  24  0 r  y .   8  8  8  0 .  s  0 24  0  0  0  0  0  2 1 u  None
0x1dd 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 24  0  0  0  0  0  2 1 u  None
0x1de 24 tc  0  24  0 r  . .   8  8  8  0 .  s  0 24  0  0  0  0  0  2 1 u  None
0x1df 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0  0  0  0  0  2 1 u  None
0x1e0 24 dc  0  24  0 r  y .   8  8  8  0 .  s  0 24  0  0  0  0  0  2 1 u  None
0x1e1 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 24  0  0  0  0  0  2 1 u  None
0x1e2 24 dc  0  24  0 r  . .   8  8  8  0 .  s  0 24  0  0  0  0  0  2 1 u  None
0x1e3 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0  0  0  0  0  4 1 u  None
0x1e4 24 tc  0  24  0 r  y .   8  8  8  0 .  s  0 24  0  0  0  0  0  4 1 u  None
0x1e5 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 24  0  0  0  0  0  4 1 u  None
0x1e6 24 tc  0  24  0 r  . .   8  8  8  0 .  s  0 24  0  0  0  0  0  4 1 u  None
0x1e7 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0  0  0  0  0  4 1 u  None
0x1e8 24 dc  0  24  0 r  y .   8  8  8  0 .  s  0 24  0  0  0  0  0  4 1 u  None
0x1e9 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 24  0  0  0  0  0  4 1 u  None
0x1ea 24 dc  0  24  0 r  . .   8  8  8  0 .  s  0 24  0  0  0  0  0  4 1 u  None
0x1eb 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0  0  0  0  0  8 1 u  None
0x1ec 24 tc  0  24  0 r  y .   8  8  8  0 .  s  0 24  0  0  0  0  0  8 1 u  None
0x1ed 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 24  0  0  0  0  0  8 1 u  None
0x1ee 24 tc  0  24  0 r  . .   8  8  8  0 .  s  0 24  0  0  0  0  0  8 1 u  None
0x1ef 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0  0  0  0  0  8 1 u  None
0x1f0 24 dc  0  24  0 r  y .   8  8  8  0 .  s  0 24  0  0  0  0  0  8 1 u  None
0x1f1 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 24  0  0  0  0  0  8 1 u  None
0x1f2 24 dc  0  24  0 r  . .   8  8  8  0 .  s  0 24  0  0  0  0  0  8 1 u  None
0x1f3 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8  0  0  0  0  2 1 u  None
0x1f4 24 tc  0  24  0 r  y .   8  8  8  0 .  s  0 24  8  0  0  0  0  2 1 u  None
0x1f5 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 24  8  0  0  0  0  2 1 u  None
0x1f6 24 tc  0  24  0 r  . .   8  8  8  0 .  s  0 24  8  0  0  0  0  2 1 u  None
0x1f7 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8  0  0  0  0  2 1 u  None
0x1f8 24 dc  0  24  0 r  y .   8  8  8  0 .  s  0 24  8  0  0  0  0  2 1 u  None
0x1f9 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 24  8  0  0  0  0  2 1 u  None
0x1fa 24 dc  0  24  0 r  . .   8  8  8  0 .  s  0 24  8  0  0  0  0  2 1 u  None
0x1fb 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8  0  0  0  0  4 1 u  None
0x1fc 24 tc  0  24  0 r  y .   8  8  8  0 .  s  0 24  8  0  0  0  0  4 1 u  None
0x1fd 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 24  8  0  0  0  0  4 1 u  None
0x1fe 24 tc  0  24  0 r  . .   8  8  8  0 .  s  0 24  8  0  0  0  0  4 1 u  None
0x1ff 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8  0  0  0  0  4 1 u  None
0x200 24 dc  0  24  0 r  y .   8  8  8  0 .  s  0 24  8  0  0  0  0  4 1 u  None
0x201 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 24  8  0  0  0  0  4 1 u  None
0x202 24 dc  0  24  0 r  . .   8  8  8  0 .  s  0 24  8  0  0  0  0  4 1 u  None
0x203 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8  0  0  0  0  8 1 u  None
0x204 24 tc  0  24  0 r  y .   8  8  8  0 .  s  0 24  8  0  0  0  0  8 1 u  None
0x205 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 24  8  0  0  0  0  8 1 u  None
0x206 24 tc  0  24  0 r  . .   8  8  8  0 .  s  0 24  8  0  0  0  0  8 1 u  None
0x207 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8  0  0  0  0  8 1 u  None
0x208 24 dc  0  24  0 r  y .   8  8  8  0 .  s  0 24  8  0  0  0  0  8 1 u  None
0x209 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 24  8  0  0  0  0  8 1 u  None
0x20a 24 dc  0  24  0 r  . .   8  8  8  0 .  s  0 24  8  0  0  0  0  8 1 u  None
0x20b  0 tc  0  16  0 r  y .   5  6  5  0 .  .  0  0  0  0  0  0  0  0 0 u  None
0x20c  0 tc  0  16  0 r  . .   5  6  5  0 .  .  0  0  0  0  0  0  0  0 0 u  None
0x20d  0 dc  0  16  0 r  y .   5  6  5  0 .  .  0  0  0  0  0  0  0  0 0 u  None
0x20e  0 dc  0  16  0 r  . .   5  6  5  0 .  .  0  0  0  0  0  0  0  0 0 u  None
0x20f  0 tc  0  16  0 r  y .   5  6  5  0 .  .  0 16  0  0  0  0  0  0 0 u  None
0x210  0 tc  0  16  0 r  . .   5  6  5  0 .  .  0 16  0  0  0  0  0  0 0 u  None
0x211  0 dc  0  16  0 r  y .   5  6  5  0 .  .  0 16  0  0  0  0  0  0 0 u  None
0x212  0 dc  0  16  0 r  . .   5  6  5  0 .  .  0 16  0  0  0  0  0  0 0 u  None
0x213  0 tc  0  16  0 r  y .   5  6  5  0 .  .  0 24  0  0  0  0  0  0 0 u  None
0x214  0 tc  0  16  0 r  . .   5  6  5  0 .  .  0 24  0  0  0  0  0  0 0 u  None
0x215  0 dc  0  16  0 r  y .   5  6  5  0 .  .  0 24  0  0  0  0  0  0 0 u  None
0x216  0 dc  0  16  0 r  . .   5  6  5  0 .  .  0 24  0  0  0  0  0  0 0 u  None
0x217  0 tc  0  16  0 r  y .   5  6  5  0 .  .  0 24  8  0  0  0  0  0 0 u  None
0x218  0 tc  0  16  0 r  . .   5  6  5  0 .  .  0 24  8  0  0  0  0  0 0 u  None
0x219  0 dc  0  16  0 r  y .   5  6  5  0 .  .  0 24  8  0  0  0  0  0 0 u  None
0x21a  0 dc  0  16  0 r  . .   5  6  5  0 .  .  0 24  8  0  0  0  0  0 0 u  None
0x21b  0 tc  0  16  0 r  y .   5  6  5  0 .  .  0  0  0  0  0  0  0  2 1 u  None
0x21c  0 tc  0  16  0 r  . .   5  6  5  0 .  .  0  0  0  0  0  0  0  2 1 u  None
0x21d  0 dc  0  16  0 r  y .   5  6  5  0 .  .  0  0  0  0  0  0  0  2 1 u  None
0x21e  0 dc  0  16  0 r  . .   5  6  5  0 .  .  0  0  0  0  0  0  0  2 1 u  None
0x21f  0 tc  0  16  0 r  y .   5  6  5  0 .  .  0  0  0  0  0  0  0  4 1 u  None
0x220  0 tc  0  16  0 r  . .   5  6  5  0 .  .  0  0  0  0  0  0  0  4 1 u  None
0x221  0 dc  0  16  0 r  y .   5  6  5  0 .  .  0  0  0  0  0  0  0  4 1 u  None
0x222  0 dc  0  16  0 r  . .   5  6  5  0 .  .  0  0  0  0  0  0  0  4 1 u  None
0x223  0 tc  0  16  0 r  y .   5  6  5  0 .  .  0  0  0  0  0  0  0  8 1 u  None
0x224  0 tc  0  16  0 r  . .   5  6  5  0 .  .  0  0  0  0  0  0  0  8 1 u  None
0x225  0 dc  0  16  0 r  y .   5  6  5  0 .  .  0  0  0  0  0  0  0  8 1 u  None
0x226  0 dc  0  16  0 r  . .   5  6  5  0 .  .  0  0  0  0  0  0  0  8 1 u  None
0x227  0 tc  0  16  0 r  y .   5  6  5  0 .  .  0 16  0  0  0  0  0  2 1 u  None
0x228  0 tc  0  16  0 r  . .   5  6  5  0 .  .  0 16  0  0  0  0  0  2 1 u  None
0x229  0 dc  0  16  0 r  y .   5  6  5  0 .  .  0 16  0  0  0  0  0  2 1 u  None
0x22a  0 dc  0  16  0 r  . .   5  6  5  0 .  .  0 16  0  0  0  0  0  2 1 u  None
0x22b  0 tc  0  16  0 r  y .   5  6  5  0 .  .  0 16  0  0  0  0  0  4 1 u  None
0x22c  0 tc  0  16  0 r  . .   5  6  5  0 .  .  0 16  0  0  0  0  0  4 1 u  None
0x22d  0 dc  0  16  0 r  y .   5  6  5  0 .  .  0 16  0  0  0  0  0  4 1 u  None
0x22e  0 dc  0  16  0 r  . .   5  6  5  0 .  .  0 16  0  0  0  0  0  4 1 u  None
0x22f  0 tc  0  16  0 r  y .   5  6  5  0 .  .  0 16  0  0  0  0  0  8 1 u  None
0x230  0 tc  0  16  0 r  . .   5  6  5  0 .  .  0 16  0  0  0  0  0  8 1 u  None
0x231  0 dc  0  16  0 r  y .   5  6  5  0 .  .  0 16  0  0  0  0  0  8 1 u  None
0x232  0 dc  0  16  0 r  . .   5  6  5  0 .  .  0 16  0  0  0  0  0  8 1 u  None
0x233  0 tc  0  16  0 r  y .   5  6  5  0 .  .  0 24  0  0  0  0  0  2 1 u  None
0x234  0 tc  0  16  0 r  . .   5  6  5  0 .  .  0 24  0  0  0  0  0  2 1 u  None
0x235  0 dc  0  16  0 r  y .   5  6  5  0 .  .  0 24  0  0  0  0  0  2 1 u  None
0x236  0 dc  0  16  0 r  . .   5  6  5  0 .  .  0 24  0  0  0  0  0  2 1 u  None
0x237  0 tc  0  16  0 r  y .   5  6  5  0 .  .  0 24  0  0  0  0  0  4 1 u  None
0x238  0 tc  0  16  0 r  . .   5  6  5  0 .  .  0 24  0  0  0  0  0  4 1 u  None
0x239  0 dc  0  16  0 r  y .   5  6  5  0 .  .  0 24  0  0  0  0  0  4 1 u  None
0x23a  0 dc  0  16  0 r  . .   5  6  5  0 .  .  0 24  0  0  0  0  0  4 1 u  None
0x23b  0 tc  0  16  0 r  y .   5  6  5  0 .  .  0 24  0  0  0  0  0  8 1 u  None
0x23c  0 tc  0  16  0 r  . .   5  6  5  0 .  .  0 24  0  0  0  0  0  8 1 u  None
0x23d  0 dc  0  16  0 r  y .   5  6  5  0 .  .  0 24  0  0  0  0  0  8 1 u  None
0x23e  0 dc  0  16  0 r  . .   5  6  5  0 .  .  0 24  0  0  0  0  0  8 1 u  None
0x23f  0 tc  0  16  0 r  y .   5  6  5  0 .  .  0 24  8  0  0  0  0  2 1 u  None
0x240  0 tc  0  16  0 r  . .   5  6  5  0 .  .  0 24  8  0  0  0  0  2 1 u  None
0x241  0 dc  0  16  0 r  y .   5  6  5  0 .  .  0 24  8  0  0  0  0  2 1 u  None
0x242  0 dc  0  16  0 r  . .   5  6  5  0 .  .  0 24  8  0  0  0  0  2 1 u  None
0x243  0 tc  0  16  0 r  y .   5  6  5  0 .  .  0 24  8  0  0  0  0  4 1 u  None
0x244  0 tc  0  16  0 r  . .   5  6  5  0 .  .  0 24  8  0  0  0  0  4 1 u  None
0x245  0 dc  0  16  0 r  y .   5  6  5  0 .  .  0 24  8  0  0  0  0  4 1 u  None
0x246  0 dc  0  16  0 r  . .   5  6  5  0 .  .  0 24  8  0  0  0  0  4 1 u  None
0x247  0 tc  0  16  0 r  y .   5  6  5  0 .  .  0 24  8  0  0  0  0  8 1 u  None
0x248  0 tc  0  16  0 r  . .   5  6  5  0 .  .  0 24  8  0  0  0  0  8 1 u  None
0x249  0 dc  0  16  0 r  y .   5  6  5  0 .  .  0 24  8  0  0  0  0  8 1 u  None
0x24a  0 dc  0  16  0 r  . .   5  6  5  0 .  .  0 24  8  0  0  0  0  8 1 u  None
```

## Vulkan

```zsh
==========
VULKANINFO
==========

Vulkan Instance Version: 1.3.255


Instance Extensions: count = 23
===============================
	VK_EXT_acquire_drm_display             : extension revision 1
	VK_EXT_acquire_xlib_display            : extension revision 1
	VK_EXT_debug_report                    : extension revision 10
	VK_EXT_debug_utils                     : extension revision 2
	VK_EXT_direct_mode_display             : extension revision 1
	VK_EXT_display_surface_counter         : extension revision 1
	VK_EXT_surface_maintenance1            : extension revision 1
	VK_EXT_swapchain_colorspace            : extension revision 4
	VK_KHR_device_group_creation           : extension revision 1
	VK_KHR_display                         : extension revision 23
	VK_KHR_external_fence_capabilities     : extension revision 1
	VK_KHR_external_memory_capabilities    : extension revision 1
	VK_KHR_external_semaphore_capabilities : extension revision 1
	VK_KHR_get_display_properties2         : extension revision 1
	VK_KHR_get_physical_device_properties2 : extension revision 2
	VK_KHR_get_surface_capabilities2       : extension revision 1
	VK_KHR_portability_enumeration         : extension revision 1
	VK_KHR_surface                         : extension revision 25
	VK_KHR_surface_protected_capabilities  : extension revision 1
	VK_KHR_wayland_surface                 : extension revision 6
	VK_KHR_xcb_surface                     : extension revision 6
	VK_KHR_xlib_surface                    : extension revision 6
	VK_LUNARG_direct_driver_loading        : extension revision 1

Layers:
=======
Presentable Surfaces:
=====================
GPU id : 0 (AMD Radeon RX 5500 XT (RADV NAVI14)):
	Surface types: count = 2
		VK_KHR_xcb_surface
		VK_KHR_xlib_surface
	Formats: count = 2
		SurfaceFormat[0]:
			format = FORMAT_B8G8R8A8_SRGB
			colorSpace = COLOR_SPACE_SRGB_NONLINEAR_KHR
		SurfaceFormat[1]:
			format = FORMAT_B8G8R8A8_UNORM
			colorSpace = COLOR_SPACE_SRGB_NONLINEAR_KHR
	Present Modes: count = 4
		PRESENT_MODE_IMMEDIATE_KHR
		PRESENT_MODE_MAILBOX_KHR
		PRESENT_MODE_FIFO_KHR
		PRESENT_MODE_FIFO_RELAXED_KHR
	VkSurfaceCapabilitiesKHR:
	-------------------------
		minImageCount = 3
		maxImageCount = 0
		currentExtent:
			width  = 256
			height = 256
		minImageExtent:
			width  = 256
			height = 256
		maxImageExtent:
			width  = 256
			height = 256
		maxImageArrayLayers = 1
		supportedTransforms: count = 1
			SURFACE_TRANSFORM_IDENTITY_BIT_KHR
		currentTransform = SURFACE_TRANSFORM_IDENTITY_BIT_KHR
		supportedCompositeAlpha: count = 2
			COMPOSITE_ALPHA_OPAQUE_BIT_KHR
			COMPOSITE_ALPHA_INHERIT_BIT_KHR
		supportedUsageFlags: count = 7
			IMAGE_USAGE_TRANSFER_SRC_BIT
			IMAGE_USAGE_TRANSFER_DST_BIT
			IMAGE_USAGE_SAMPLED_BIT
			IMAGE_USAGE_STORAGE_BIT
			IMAGE_USAGE_COLOR_ATTACHMENT_BIT
			IMAGE_USAGE_INPUT_ATTACHMENT_BIT
			IMAGE_USAGE_ATTACHMENT_FEEDBACK_LOOP_BIT_EXT
	VkSurfaceProtectedCapabilitiesKHR:
	----------------------------------
		supportsProtected = false


GPU id : 0 (AMD Radeon RX 5500 XT (RADV NAVI14)):
	Surface type = VK_KHR_wayland_surface
	Formats: count = 7
		SurfaceFormat[0]:
			format = FORMAT_A2B10G10R10_UNORM_PACK32
			colorSpace = COLOR_SPACE_SRGB_NONLINEAR_KHR
		SurfaceFormat[1]:
			format = FORMAT_A2R10G10B10_UNORM_PACK32
			colorSpace = COLOR_SPACE_SRGB_NONLINEAR_KHR
		SurfaceFormat[2]:
			format = FORMAT_B8G8R8A8_SRGB
			colorSpace = COLOR_SPACE_SRGB_NONLINEAR_KHR
		SurfaceFormat[3]:
			format = FORMAT_B8G8R8A8_UNORM
			colorSpace = COLOR_SPACE_SRGB_NONLINEAR_KHR
		SurfaceFormat[4]:
			format = FORMAT_R8G8B8A8_SRGB
			colorSpace = COLOR_SPACE_SRGB_NONLINEAR_KHR
		SurfaceFormat[5]:
			format = FORMAT_R8G8B8A8_UNORM
			colorSpace = COLOR_SPACE_SRGB_NONLINEAR_KHR
		SurfaceFormat[6]:
			format = FORMAT_R5G6B5_UNORM_PACK16
			colorSpace = COLOR_SPACE_SRGB_NONLINEAR_KHR
	Present Modes: count = 2
		PRESENT_MODE_MAILBOX_KHR
		PRESENT_MODE_FIFO_KHR
	VkSurfaceCapabilitiesKHR:
	-------------------------
		minImageCount = 4
		maxImageCount = 0
		currentExtent:
			width  = 4294967295
			height = 4294967295
		minImageExtent:
			width  = 1
			height = 1
		maxImageExtent:
			width  = 16384
			height = 16384
		maxImageArrayLayers = 1
		supportedTransforms: count = 1
			SURFACE_TRANSFORM_IDENTITY_BIT_KHR
		currentTransform = SURFACE_TRANSFORM_IDENTITY_BIT_KHR
		supportedCompositeAlpha: count = 2
			COMPOSITE_ALPHA_OPAQUE_BIT_KHR
			COMPOSITE_ALPHA_PRE_MULTIPLIED_BIT_KHR
		supportedUsageFlags: count = 7
			IMAGE_USAGE_TRANSFER_SRC_BIT
			IMAGE_USAGE_TRANSFER_DST_BIT
			IMAGE_USAGE_SAMPLED_BIT
			IMAGE_USAGE_STORAGE_BIT
			IMAGE_USAGE_COLOR_ATTACHMENT_BIT
			IMAGE_USAGE_INPUT_ATTACHMENT_BIT
			IMAGE_USAGE_ATTACHMENT_FEEDBACK_LOOP_BIT_EXT
	VkSurfaceProtectedCapabilitiesKHR:
	----------------------------------
		supportsProtected = false



Device Properties and Extensions:
=================================
GPU0:
VkPhysicalDeviceProperties:
---------------------------
	apiVersion        = 1.3.246 (4206838)
	driverVersion     = 23.1.3 (96473091)
	vendorID          = 0x1002
	deviceID          = 0x7340
	deviceType        = PHYSICAL_DEVICE_TYPE_DISCRETE_GPU
	deviceName        = AMD Radeon RX 5500 XT (RADV NAVI14)
	pipelineCacheUUID = 057190d0-d217-a1d8-6b8b-682fe1fe7953

VkPhysicalDeviceLimits:
-----------------------
	maxImageDimension1D                             = 16384
	maxImageDimension2D                             = 16384
	maxImageDimension3D                             = 2048
	maxImageDimensionCube                           = 16384
	maxImageArrayLayers                             = 2048
	maxTexelBufferElements                          = 4294967295
	maxUniformBufferRange                           = 4294967295
	maxStorageBufferRange                           = 4294967295
	maxPushConstantsSize                            = 256
	maxMemoryAllocationCount                        = 4294967295
	maxSamplerAllocationCount                       = 65536
	bufferImageGranularity                          = 0x00000001
	sparseAddressSpaceSize                          = 0xfffffffc
	maxBoundDescriptorSets                          = 32
	maxPerStageDescriptorSamplers                   = 8388606
	maxPerStageDescriptorUniformBuffers             = 8388606
	maxPerStageDescriptorStorageBuffers             = 8388606
	maxPerStageDescriptorSampledImages              = 8388606
	maxPerStageDescriptorStorageImages              = 8388606
	maxPerStageDescriptorInputAttachments           = 8388606
	maxPerStageResources                            = 8388606
	maxDescriptorSetSamplers                        = 8388606
	maxDescriptorSetUniformBuffers                  = 8388606
	maxDescriptorSetUniformBuffersDynamic           = 16
	maxDescriptorSetStorageBuffers                  = 8388606
	maxDescriptorSetStorageBuffersDynamic           = 8
	maxDescriptorSetSampledImages                   = 8388606
	maxDescriptorSetStorageImages                   = 8388606
	maxDescriptorSetInputAttachments                = 8388606
	maxVertexInputAttributes                        = 32
	maxVertexInputBindings                          = 32
	maxVertexInputAttributeOffset                   = 4294967295
	maxVertexInputBindingStride                     = 2048
	maxVertexOutputComponents                       = 128
	maxTessellationGenerationLevel                  = 64
	maxTessellationPatchSize                        = 32
	maxTessellationControlPerVertexInputComponents  = 128
	maxTessellationControlPerVertexOutputComponents = 128
	maxTessellationControlPerPatchOutputComponents  = 120
	maxTessellationControlTotalOutputComponents     = 4096
	maxTessellationEvaluationInputComponents        = 128
	maxTessellationEvaluationOutputComponents       = 128
	maxGeometryShaderInvocations                    = 127
	maxGeometryInputComponents                      = 64
	maxGeometryOutputComponents                     = 128
	maxGeometryOutputVertices                       = 256
	maxGeometryTotalOutputComponents                = 1024
	maxFragmentInputComponents                      = 128
	maxFragmentOutputAttachments                    = 8
	maxFragmentDualSrcAttachments                   = 1
	maxFragmentCombinedOutputResources              = 8388606
	maxComputeSharedMemorySize                      = 65536
	maxComputeWorkGroupCount: count = 3
		65535
		65535
		65535
	maxComputeWorkGroupInvocations                  = 1024
	maxComputeWorkGroupSize: count = 3
		1024
		1024
		1024
	subPixelPrecisionBits                           = 8
	subTexelPrecisionBits                           = 8
	mipmapPrecisionBits                             = 8
	maxDrawIndexedIndexValue                        = 4294967295
	maxDrawIndirectCount                            = 4294967295
	maxSamplerLodBias                               = 16
	maxSamplerAnisotropy                            = 16
	maxViewports                                    = 16
	maxViewportDimensions: count = 2
		16384
		16384
	viewportBoundsRange: count = 2
		-32768
		32767
	viewportSubPixelBits                            = 8
	minMemoryMapAlignment                           = 4096
	minTexelBufferOffsetAlignment                   = 0x00000004
	minUniformBufferOffsetAlignment                 = 0x00000004
	minStorageBufferOffsetAlignment                 = 0x00000004
	minTexelOffset                                  = -32
	maxTexelOffset                                  = 31
	minTexelGatherOffset                            = -32
	maxTexelGatherOffset                            = 31
	minInterpolationOffset                          = -2
	maxInterpolationOffset                          = 2
	subPixelInterpolationOffsetBits                 = 8
	maxFramebufferWidth                             = 16384
	maxFramebufferHeight                            = 16384
	maxFramebufferLayers                            = 1024
	framebufferColorSampleCounts: count = 4
		SAMPLE_COUNT_1_BIT
		SAMPLE_COUNT_2_BIT
		SAMPLE_COUNT_4_BIT
		SAMPLE_COUNT_8_BIT
	framebufferDepthSampleCounts: count = 4
		SAMPLE_COUNT_1_BIT
		SAMPLE_COUNT_2_BIT
		SAMPLE_COUNT_4_BIT
		SAMPLE_COUNT_8_BIT
	framebufferStencilSampleCounts: count = 4
		SAMPLE_COUNT_1_BIT
		SAMPLE_COUNT_2_BIT
		SAMPLE_COUNT_4_BIT
		SAMPLE_COUNT_8_BIT
	framebufferNoAttachmentsSampleCounts: count = 4
		SAMPLE_COUNT_1_BIT
		SAMPLE_COUNT_2_BIT
		SAMPLE_COUNT_4_BIT
		SAMPLE_COUNT_8_BIT
	maxColorAttachments                             = 8
	sampledImageColorSampleCounts: count = 4
		SAMPLE_COUNT_1_BIT
		SAMPLE_COUNT_2_BIT
		SAMPLE_COUNT_4_BIT
		SAMPLE_COUNT_8_BIT
	sampledImageIntegerSampleCounts: count = 4
		SAMPLE_COUNT_1_BIT
		SAMPLE_COUNT_2_BIT
		SAMPLE_COUNT_4_BIT
		SAMPLE_COUNT_8_BIT
	sampledImageDepthSampleCounts: count = 4
		SAMPLE_COUNT_1_BIT
		SAMPLE_COUNT_2_BIT
		SAMPLE_COUNT_4_BIT
		SAMPLE_COUNT_8_BIT
	sampledImageStencilSampleCounts: count = 4
		SAMPLE_COUNT_1_BIT
		SAMPLE_COUNT_2_BIT
		SAMPLE_COUNT_4_BIT
		SAMPLE_COUNT_8_BIT
	storageImageSampleCounts: count = 4
		SAMPLE_COUNT_1_BIT
		SAMPLE_COUNT_2_BIT
		SAMPLE_COUNT_4_BIT
		SAMPLE_COUNT_8_BIT
	maxSampleMaskWords                              = 1
	timestampComputeAndGraphics                     = true
	timestampPeriod                                 = 10
	maxClipDistances                                = 8
	maxCullDistances                                = 8
	maxCombinedClipAndCullDistances                 = 8
	discreteQueuePriorities                         = 2
	pointSizeRange: count = 2
		0
		8191.88
	lineWidthRange: count = 2
		0
		8
	pointSizeGranularity                            = 0.125
	lineWidthGranularity                            = 0.125
	strictLines                                     = false
	standardSampleLocations                         = true
	optimalBufferCopyOffsetAlignment                = 0x00000001
	optimalBufferCopyRowPitchAlignment              = 0x00000001
	nonCoherentAtomSize                             = 0x00000040

VkPhysicalDeviceSparseProperties:
---------------------------------
	residencyStandard2DBlockShape            = true
	residencyStandard2DMultisampleBlockShape = false
	residencyStandard3DBlockShape            = true
	residencyAlignedMipSize                  = false
	residencyNonResidentStrict               = true

VkPhysicalDeviceConservativeRasterizationPropertiesEXT:
-------------------------------------------------------
	primitiveOverestimationSize                 = 0
	maxExtraPrimitiveOverestimationSize         = 0
	extraPrimitiveOverestimationSizeGranularity = 0
	primitiveUnderestimation                    = true
	conservativePointAndLineRasterization       = false
	degenerateTrianglesRasterized               = true
	degenerateLinesRasterized                   = false
	fullyCoveredFragmentShaderInputVariable     = true
	conservativeRasterizationPostDepthCoverage  = false

VkPhysicalDeviceCustomBorderColorPropertiesEXT:
-----------------------------------------------
	maxCustomBorderColorSamplers = 4096

VkPhysicalDeviceDepthStencilResolveProperties:
----------------------------------------------
	supportedDepthResolveModes: count = 4
		RESOLVE_MODE_SAMPLE_ZERO_BIT
		RESOLVE_MODE_AVERAGE_BIT
		RESOLVE_MODE_MIN_BIT
		RESOLVE_MODE_MAX_BIT
	supportedStencilResolveModes: count = 3
		RESOLVE_MODE_SAMPLE_ZERO_BIT
		RESOLVE_MODE_MIN_BIT
		RESOLVE_MODE_MAX_BIT
	independentResolveNone = true
	independentResolve     = true

VkPhysicalDeviceDescriptorBufferDensityMapPropertiesEXT:
--------------------------------------------------------
	combinedImageSamplerDensityMapDescriptorSize = 0

VkPhysicalDeviceDescriptorBufferPropertiesEXT:
----------------------------------------------
	combinedImageSamplerDescriptorSingleArray            = true
	bufferlessPushDescriptors                            = true
	allowSamplerImageViewPostSubmitCreation              = false
	descriptorBufferOffsetAlignment                      = 0x00000004
	maxDescriptorBufferBindings                          = 32
	maxResourceDescriptorBufferBindings                  = 32
	maxSamplerDescriptorBufferBindings                   = 32
	maxEmbeddedImmutableSamplerBindings                  = 32
	maxEmbeddedImmutableSamplers                         = 8388606
	bufferCaptureReplayDescriptorDataSize                = 0
	imageCaptureReplayDescriptorDataSize                 = 0
	imageViewCaptureReplayDescriptorDataSize             = 0
	samplerCaptureReplayDescriptorDataSize               = 0
	accelerationStructureCaptureReplayDescriptorDataSize = 0
	samplerDescriptorSize                                = 16
	combinedImageSamplerDescriptorSize                   = 96
	sampledImageDescriptorSize                           = 64
	storageImageDescriptorSize                           = 32
	uniformTexelBufferDescriptorSize                     = 16
	robustUniformTexelBufferDescriptorSize               = 16
	storageTexelBufferDescriptorSize                     = 16
	robustStorageTexelBufferDescriptorSize               = 16
	uniformBufferDescriptorSize                          = 16
	robustUniformBufferDescriptorSize                    = 16
	storageBufferDescriptorSize                          = 16
	robustStorageBufferDescriptorSize                    = 16
	inputAttachmentDescriptorSize                        = 64
	accelerationStructureDescriptorSize                  = 16
	maxSamplerDescriptorBufferRange                      = 0xffffffff
	maxResourceDescriptorBufferRange                     = 0xffffffff
	samplerDescriptorBufferAddressSpaceSize              = 0xfffffffc
	resourceDescriptorBufferAddressSpaceSize             = 0xfffffffc
	descriptorBufferAddressSpaceSize                     = 0xfffffffc

VkPhysicalDeviceDescriptorIndexingProperties:
---------------------------------------------
	maxUpdateAfterBindDescriptorsInAllPools              = 67108863
	shaderUniformBufferArrayNonUniformIndexingNative     = false
	shaderSampledImageArrayNonUniformIndexingNative      = false
	shaderStorageBufferArrayNonUniformIndexingNative     = false
	shaderStorageImageArrayNonUniformIndexingNative      = false
	shaderInputAttachmentArrayNonUniformIndexingNative   = false
	robustBufferAccessUpdateAfterBind                    = true
	quadDivergentImplicitLod                             = false
	maxPerStageDescriptorUpdateAfterBindSamplers         = 8388606
	maxPerStageDescriptorUpdateAfterBindUniformBuffers   = 8388606
	maxPerStageDescriptorUpdateAfterBindStorageBuffers   = 8388606
	maxPerStageDescriptorUpdateAfterBindSampledImages    = 8388606
	maxPerStageDescriptorUpdateAfterBindStorageImages    = 8388606
	maxPerStageDescriptorUpdateAfterBindInputAttachments = 8388606
	maxPerStageUpdateAfterBindResources                  = 8388606
	maxDescriptorSetUpdateAfterBindSamplers              = 8388606
	maxDescriptorSetUpdateAfterBindUniformBuffers        = 8388606
	maxDescriptorSetUpdateAfterBindUniformBuffersDynamic = 16
	maxDescriptorSetUpdateAfterBindStorageBuffers        = 8388606
	maxDescriptorSetUpdateAfterBindStorageBuffersDynamic = 8
	maxDescriptorSetUpdateAfterBindSampledImages         = 8388606
	maxDescriptorSetUpdateAfterBindStorageImages         = 8388606
	maxDescriptorSetUpdateAfterBindInputAttachments      = 8388606

VkPhysicalDeviceDiscardRectanglePropertiesEXT:
----------------------------------------------
	maxDiscardRectangles = 4

VkPhysicalDeviceDriverProperties:
---------------------------------
	driverID        = DRIVER_ID_MESA_RADV
	driverName      = radv
	driverInfo      = Mesa 23.1.3
	conformanceVersion:
		major    = 1
		minor    = 2
		subminor = 7
		patch    = 1

VkPhysicalDeviceDrmPropertiesEXT:
---------------------------------
	hasPrimary   = true
	hasRender    = true
	primaryMajor = 226
	primaryMinor = 1
	renderMajor  = 226
	renderMinor  = 129

VkPhysicalDeviceExtendedDynamicState3PropertiesEXT:
---------------------------------------------------
	dynamicPrimitiveTopologyUnrestricted = false

VkPhysicalDeviceExternalMemoryHostPropertiesEXT:
------------------------------------------------
	minImportedHostPointerAlignment = 0x00001000

VkPhysicalDeviceFloatControlsProperties:
----------------------------------------
	denormBehaviorIndependence            = SHADER_FLOAT_CONTROLS_INDEPENDENCE_32_BIT_ONLY
	roundingModeIndependence              = SHADER_FLOAT_CONTROLS_INDEPENDENCE_32_BIT_ONLY
	shaderSignedZeroInfNanPreserveFloat16 = true
	shaderSignedZeroInfNanPreserveFloat32 = true
	shaderSignedZeroInfNanPreserveFloat64 = true
	shaderDenormPreserveFloat16           = true
	shaderDenormPreserveFloat32           = true
	shaderDenormPreserveFloat64           = true
	shaderDenormFlushToZeroFloat16        = true
	shaderDenormFlushToZeroFloat32        = true
	shaderDenormFlushToZeroFloat64        = true
	shaderRoundingModeRTEFloat16          = true
	shaderRoundingModeRTEFloat32          = true
	shaderRoundingModeRTEFloat64          = true
	shaderRoundingModeRTZFloat16          = true
	shaderRoundingModeRTZFloat32          = true
	shaderRoundingModeRTZFloat64          = true

VkPhysicalDeviceGraphicsPipelineLibraryPropertiesEXT:
-----------------------------------------------------
	graphicsPipelineLibraryFastLinking                        = true
	graphicsPipelineLibraryIndependentInterpolationDecoration = true

VkPhysicalDeviceIDProperties:
-----------------------------
	deviceUUID      = 00000000-0300-0000-0000-000000000000
	driverUUID      = 414d442d-4d45-5341-2d44-525600000000
	deviceNodeMask  = 0
	deviceLUIDValid = false

VkPhysicalDeviceInlineUniformBlockProperties:
---------------------------------------------
	maxInlineUniformBlockSize                               = 4194304
	maxPerStageDescriptorInlineUniformBlocks                = 134217728
	maxPerStageDescriptorUpdateAfterBindInlineUniformBlocks = 134217728
	maxDescriptorSetInlineUniformBlocks                     = 64
	maxDescriptorSetUpdateAfterBindInlineUniformBlocks      = 64

VkPhysicalDeviceLineRasterizationPropertiesEXT:
-----------------------------------------------
	lineSubPixelPrecisionBits = 4

VkPhysicalDeviceMaintenance3Properties:
---------------------------------------
	maxPerSetDescriptors    = 22369621
	maxMemoryAllocationSize = 0xfffffffc

VkPhysicalDeviceMaintenance4Properties:
---------------------------------------
	maxBufferSize = 0xfffffffc

VkPhysicalDeviceMultiDrawPropertiesEXT:
---------------------------------------
	maxMultiDrawCount = 2048

VkPhysicalDeviceMultiviewProperties:
------------------------------------
	maxMultiviewViewCount     = 8
	maxMultiviewInstanceIndex = 2147483647

VkPhysicalDevicePCIBusInfoPropertiesEXT:
----------------------------------------
	pciDomain   = 0
	pciBus      = 3
	pciDevice   = 0
	pciFunction = 0

VkPhysicalDevicePointClippingProperties:
----------------------------------------
	pointClippingBehavior = POINT_CLIPPING_BEHAVIOR_ALL_CLIP_PLANES

VkPhysicalDeviceProtectedMemoryProperties:
------------------------------------------
	protectedNoFault = false

VkPhysicalDeviceProvokingVertexPropertiesEXT:
---------------------------------------------
	provokingVertexModePerPipeline                       = true
	transformFeedbackPreservesTriangleFanProvokingVertex = true

VkPhysicalDevicePushDescriptorPropertiesKHR:
--------------------------------------------
	maxPushDescriptors = 32

VkPhysicalDeviceRobustness2PropertiesEXT:
-----------------------------------------
	robustStorageBufferAccessSizeAlignment = 0x00000004
	robustUniformBufferAccessSizeAlignment = 0x00000004

VkPhysicalDeviceSamplerFilterMinmaxProperties:
----------------------------------------------
	filterMinmaxSingleComponentFormats = true
	filterMinmaxImageComponentMapping  = true

VkPhysicalDeviceShaderIntegerDotProductProperties:
--------------------------------------------------
	integerDotProduct8BitUnsignedAccelerated                                      = true
	integerDotProduct8BitSignedAccelerated                                        = true
	integerDotProduct8BitMixedSignednessAccelerated                               = false
	integerDotProduct4x8BitPackedUnsignedAccelerated                              = true
	integerDotProduct4x8BitPackedSignedAccelerated                                = true
	integerDotProduct4x8BitPackedMixedSignednessAccelerated                       = false
	integerDotProduct16BitUnsignedAccelerated                                     = true
	integerDotProduct16BitSignedAccelerated                                       = true
	integerDotProduct16BitMixedSignednessAccelerated                              = false
	integerDotProduct32BitUnsignedAccelerated                                     = false
	integerDotProduct32BitSignedAccelerated                                       = false
	integerDotProduct32BitMixedSignednessAccelerated                              = false
	integerDotProduct64BitUnsignedAccelerated                                     = false
	integerDotProduct64BitSignedAccelerated                                       = false
	integerDotProduct64BitMixedSignednessAccelerated                              = false
	integerDotProductAccumulatingSaturating8BitUnsignedAccelerated                = true
	integerDotProductAccumulatingSaturating8BitSignedAccelerated                  = true
	integerDotProductAccumulatingSaturating8BitMixedSignednessAccelerated         = false
	integerDotProductAccumulatingSaturating4x8BitPackedUnsignedAccelerated        = true
	integerDotProductAccumulatingSaturating4x8BitPackedSignedAccelerated          = true
	integerDotProductAccumulatingSaturating4x8BitPackedMixedSignednessAccelerated = false
	integerDotProductAccumulatingSaturating16BitUnsignedAccelerated               = true
	integerDotProductAccumulatingSaturating16BitSignedAccelerated                 = true
	integerDotProductAccumulatingSaturating16BitMixedSignednessAccelerated        = false
	integerDotProductAccumulatingSaturating32BitUnsignedAccelerated               = false
	integerDotProductAccumulatingSaturating32BitSignedAccelerated                 = false
	integerDotProductAccumulatingSaturating32BitMixedSignednessAccelerated        = false
	integerDotProductAccumulatingSaturating64BitUnsignedAccelerated               = false
	integerDotProductAccumulatingSaturating64BitSignedAccelerated                 = false
	integerDotProductAccumulatingSaturating64BitMixedSignednessAccelerated        = false

VkPhysicalDeviceShaderModuleIdentifierPropertiesEXT:
----------------------------------------------------
	shaderModuleIdentifierAlgorithmUUID     = 4d455341-2d53-4841-3100-000000000000

VkPhysicalDeviceSubgroupProperties:
-----------------------------------
	subgroupSize              = 64
	supportedStages: count = 6
		SHADER_STAGE_VERTEX_BIT
		SHADER_STAGE_TESSELLATION_CONTROL_BIT
		SHADER_STAGE_TESSELLATION_EVALUATION_BIT
		SHADER_STAGE_GEOMETRY_BIT
		SHADER_STAGE_FRAGMENT_BIT
		SHADER_STAGE_COMPUTE_BIT
	supportedOperations: count = 8
		SUBGROUP_FEATURE_BASIC_BIT
		SUBGROUP_FEATURE_VOTE_BIT
		SUBGROUP_FEATURE_ARITHMETIC_BIT
		SUBGROUP_FEATURE_BALLOT_BIT
		SUBGROUP_FEATURE_SHUFFLE_BIT
		SUBGROUP_FEATURE_SHUFFLE_RELATIVE_BIT
		SUBGROUP_FEATURE_CLUSTERED_BIT
		SUBGROUP_FEATURE_QUAD_BIT
	quadOperationsInAllStages = true

VkPhysicalDeviceSubgroupSizeControlProperties:
----------------------------------------------
	minSubgroupSize              = 32
	maxSubgroupSize              = 64
	maxComputeWorkgroupSubgroups = 4294967295
	requiredSubgroupSizeStages: count = 1
		SHADER_STAGE_COMPUTE_BIT

VkPhysicalDeviceTexelBufferAlignmentProperties:
-----------------------------------------------
	storageTexelBufferOffsetAlignmentBytes       = 0x00000004
	storageTexelBufferOffsetSingleTexelAlignment = true
	uniformTexelBufferOffsetAlignmentBytes       = 0x00000004
	uniformTexelBufferOffsetSingleTexelAlignment = true

VkPhysicalDeviceTimelineSemaphoreProperties:
--------------------------------------------
	maxTimelineSemaphoreValueDifference = 18446744073709551615

VkPhysicalDeviceTransformFeedbackPropertiesEXT:
-----------------------------------------------
	maxTransformFeedbackStreams                = 4
	maxTransformFeedbackBuffers                = 4
	maxTransformFeedbackBufferSize             = 0xffffffff
	maxTransformFeedbackStreamDataSize         = 512
	maxTransformFeedbackBufferDataSize         = 512
	maxTransformFeedbackBufferDataStride       = 512
	transformFeedbackQueries                   = true
	transformFeedbackStreamsLinesTriangles     = true
	transformFeedbackRasterizationStreamSelect = false
	transformFeedbackDraw                      = true

VkPhysicalDeviceVertexAttributeDivisorPropertiesEXT:
----------------------------------------------------
	maxVertexAttribDivisor = 4294967295

VkPhysicalDeviceVulkan11Properties:
-----------------------------------
	deviceUUID                        = 00000000-0300-0000-0000-000000000000
	driverUUID                        = 414d442d-4d45-5341-2d44-525600000000
	deviceNodeMask                    = 0
	deviceLUIDValid                   = false
	subgroupSize                      = 64
	subgroupSupportedStages: count = 6
		SHADER_STAGE_VERTEX_BIT
		SHADER_STAGE_TESSELLATION_CONTROL_BIT
		SHADER_STAGE_TESSELLATION_EVALUATION_BIT
		SHADER_STAGE_GEOMETRY_BIT
		SHADER_STAGE_FRAGMENT_BIT
		SHADER_STAGE_COMPUTE_BIT
	subgroupSupportedOperations: count = 8
		SUBGROUP_FEATURE_BASIC_BIT
		SUBGROUP_FEATURE_VOTE_BIT
		SUBGROUP_FEATURE_ARITHMETIC_BIT
		SUBGROUP_FEATURE_BALLOT_BIT
		SUBGROUP_FEATURE_SHUFFLE_BIT
		SUBGROUP_FEATURE_SHUFFLE_RELATIVE_BIT
		SUBGROUP_FEATURE_CLUSTERED_BIT
		SUBGROUP_FEATURE_QUAD_BIT
	subgroupQuadOperationsInAllStages = true
	pointClippingBehavior             = POINT_CLIPPING_BEHAVIOR_ALL_CLIP_PLANES
	maxMultiviewViewCount             = 8
	maxMultiviewInstanceIndex         = 2147483647
	protectedNoFault                  = false
	maxPerSetDescriptors              = 22369621
	maxMemoryAllocationSize           = 0xfffffffc

VkPhysicalDeviceVulkan12Properties:
-----------------------------------
	driverID                                             = DRIVER_ID_MESA_RADV
	driverName                                           = radv
	driverInfo                                           = Mesa 23.1.3
	conformanceVersion:
		major    = 1
		minor    = 2
		subminor = 7
		patch    = 1
	denormBehaviorIndependence                           = SHADER_FLOAT_CONTROLS_INDEPENDENCE_32_BIT_ONLY
	roundingModeIndependence                             = SHADER_FLOAT_CONTROLS_INDEPENDENCE_32_BIT_ONLY
	shaderSignedZeroInfNanPreserveFloat16                = true
	shaderSignedZeroInfNanPreserveFloat32                = true
	shaderSignedZeroInfNanPreserveFloat64                = true
	shaderDenormPreserveFloat16                          = true
	shaderDenormPreserveFloat32                          = true
	shaderDenormPreserveFloat64                          = true
	shaderDenormFlushToZeroFloat16                       = true
	shaderDenormFlushToZeroFloat32                       = true
	shaderDenormFlushToZeroFloat64                       = true
	shaderRoundingModeRTEFloat16                         = true
	shaderRoundingModeRTEFloat32                         = true
	shaderRoundingModeRTEFloat64                         = true
	shaderRoundingModeRTZFloat16                         = true
	shaderRoundingModeRTZFloat32                         = true
	shaderRoundingModeRTZFloat64                         = true
	maxUpdateAfterBindDescriptorsInAllPools              = 67108863
	shaderUniformBufferArrayNonUniformIndexingNative     = false
	shaderSampledImageArrayNonUniformIndexingNative      = false
	shaderStorageBufferArrayNonUniformIndexingNative     = false
	shaderStorageImageArrayNonUniformIndexingNative      = false
	shaderInputAttachmentArrayNonUniformIndexingNative   = false
	robustBufferAccessUpdateAfterBind                    = true
	quadDivergentImplicitLod                             = false
	maxPerStageDescriptorUpdateAfterBindSamplers         = 8388606
	maxPerStageDescriptorUpdateAfterBindUniformBuffers   = 8388606
	maxPerStageDescriptorUpdateAfterBindStorageBuffers   = 8388606
	maxPerStageDescriptorUpdateAfterBindSampledImages    = 8388606
	maxPerStageDescriptorUpdateAfterBindStorageImages    = 8388606
	maxPerStageDescriptorUpdateAfterBindInputAttachments = 8388606
	maxPerStageUpdateAfterBindResources                  = 8388606
	maxDescriptorSetUpdateAfterBindSamplers              = 8388606
	maxDescriptorSetUpdateAfterBindUniformBuffers        = 8388606
	maxDescriptorSetUpdateAfterBindUniformBuffersDynamic = 16
	maxDescriptorSetUpdateAfterBindStorageBuffers        = 8388606
	maxDescriptorSetUpdateAfterBindStorageBuffersDynamic = 8
	maxDescriptorSetUpdateAfterBindSampledImages         = 8388606
	maxDescriptorSetUpdateAfterBindStorageImages         = 8388606
	maxDescriptorSetUpdateAfterBindInputAttachments      = 8388606
	supportedDepthResolveModes: count = 4
		RESOLVE_MODE_SAMPLE_ZERO_BIT
		RESOLVE_MODE_AVERAGE_BIT
		RESOLVE_MODE_MIN_BIT
		RESOLVE_MODE_MAX_BIT
	supportedStencilResolveModes: count = 3
		RESOLVE_MODE_SAMPLE_ZERO_BIT
		RESOLVE_MODE_MIN_BIT
		RESOLVE_MODE_MAX_BIT
	independentResolveNone                               = true
	independentResolve                                   = true
	filterMinmaxSingleComponentFormats                   = true
	filterMinmaxImageComponentMapping                    = true
	maxTimelineSemaphoreValueDifference                  = 18446744073709551615
	framebufferIntegerColorSampleCounts: count = 1
		SAMPLE_COUNT_1_BIT

VkPhysicalDeviceVulkan13Properties:
-----------------------------------
	minSubgroupSize                                                               = 32
	maxSubgroupSize                                                               = 64
	maxComputeWorkgroupSubgroups                                                  = 4294967295
	requiredSubgroupSizeStages: count = 1
		SHADER_STAGE_COMPUTE_BIT
	maxInlineUniformBlockSize                                                     = 4194304
	maxPerStageDescriptorInlineUniformBlocks                                      = 134217728
	maxPerStageDescriptorUpdateAfterBindInlineUniformBlocks                       = 134217728
	maxDescriptorSetInlineUniformBlocks                                           = 64
	maxDescriptorSetUpdateAfterBindInlineUniformBlocks                            = 64
	maxInlineUniformTotalSize                                                     = 65535
	integerDotProduct8BitUnsignedAccelerated                                      = true
	integerDotProduct8BitSignedAccelerated                                        = true
	integerDotProduct8BitMixedSignednessAccelerated                               = false
	integerDotProduct4x8BitPackedUnsignedAccelerated                              = true
	integerDotProduct4x8BitPackedSignedAccelerated                                = true
	integerDotProduct4x8BitPackedMixedSignednessAccelerated                       = false
	integerDotProduct16BitUnsignedAccelerated                                     = true
	integerDotProduct16BitSignedAccelerated                                       = true
	integerDotProduct16BitMixedSignednessAccelerated                              = false
	integerDotProduct32BitUnsignedAccelerated                                     = false
	integerDotProduct32BitSignedAccelerated                                       = false
	integerDotProduct32BitMixedSignednessAccelerated                              = false
	integerDotProduct64BitUnsignedAccelerated                                     = false
	integerDotProduct64BitSignedAccelerated                                       = false
	integerDotProduct64BitMixedSignednessAccelerated                              = false
	integerDotProductAccumulatingSaturating8BitUnsignedAccelerated                = true
	integerDotProductAccumulatingSaturating8BitSignedAccelerated                  = true
	integerDotProductAccumulatingSaturating8BitMixedSignednessAccelerated         = false
	integerDotProductAccumulatingSaturating4x8BitPackedUnsignedAccelerated        = true
	integerDotProductAccumulatingSaturating4x8BitPackedSignedAccelerated          = true
	integerDotProductAccumulatingSaturating4x8BitPackedMixedSignednessAccelerated = false
	integerDotProductAccumulatingSaturating16BitUnsignedAccelerated               = true
	integerDotProductAccumulatingSaturating16BitSignedAccelerated                 = true
	integerDotProductAccumulatingSaturating16BitMixedSignednessAccelerated        = false
	integerDotProductAccumulatingSaturating32BitUnsignedAccelerated               = false
	integerDotProductAccumulatingSaturating32BitSignedAccelerated                 = false
	integerDotProductAccumulatingSaturating32BitMixedSignednessAccelerated        = false
	integerDotProductAccumulatingSaturating64BitUnsignedAccelerated               = false
	integerDotProductAccumulatingSaturating64BitSignedAccelerated                 = false
	integerDotProductAccumulatingSaturating64BitMixedSignednessAccelerated        = false
	storageTexelBufferOffsetAlignmentBytes                                        = 0x00000004
	storageTexelBufferOffsetSingleTexelAlignment                                  = true
	uniformTexelBufferOffsetAlignmentBytes                                        = 0x00000004
	uniformTexelBufferOffsetSingleTexelAlignment                                  = true
	maxBufferSize                                                                 = 0xfffffffc


Device Extensions: count = 152
	VK_AMD_buffer_marker                        : extension revision 1
	VK_AMD_device_coherent_memory               : extension revision 1
	VK_AMD_draw_indirect_count                  : extension revision 2
	VK_AMD_gcn_shader                           : extension revision 1
	VK_AMD_gpu_shader_half_float                : extension revision 2
	VK_AMD_gpu_shader_int16                     : extension revision 2
	VK_AMD_memory_overallocation_behavior       : extension revision 1
	VK_AMD_mixed_attachment_samples             : extension revision 1
	VK_AMD_shader_ballot                        : extension revision 1
	VK_AMD_shader_core_properties               : extension revision 2
	VK_AMD_shader_core_properties2              : extension revision 1
	VK_AMD_shader_early_and_late_fragment_tests : extension revision 1
	VK_AMD_shader_explicit_vertex_parameter     : extension revision 1
	VK_AMD_shader_fragment_mask                 : extension revision 1
	VK_AMD_shader_image_load_store_lod          : extension revision 1
	VK_AMD_shader_trinary_minmax                : extension revision 1
	VK_AMD_texture_gather_bias_lod              : extension revision 1
	VK_EXT_4444_formats                         : extension revision 1
	VK_EXT_attachment_feedback_loop_layout      : extension revision 2
	VK_EXT_border_color_swizzle                 : extension revision 1
	VK_EXT_buffer_device_address                : extension revision 2
	VK_EXT_calibrated_timestamps                : extension revision 2
	VK_EXT_color_write_enable                   : extension revision 1
	VK_EXT_conditional_rendering                : extension revision 2
	VK_EXT_conservative_rasterization           : extension revision 1
	VK_EXT_custom_border_color                  : extension revision 12
	VK_EXT_depth_clip_control                   : extension revision 1
	VK_EXT_depth_clip_enable                    : extension revision 1
	VK_EXT_depth_range_unrestricted             : extension revision 1
	VK_EXT_descriptor_buffer                    : extension revision 1
	VK_EXT_descriptor_indexing                  : extension revision 2
	VK_EXT_discard_rectangles                   : extension revision 2
	VK_EXT_display_control                      : extension revision 1
	VK_EXT_extended_dynamic_state               : extension revision 1
	VK_EXT_extended_dynamic_state2              : extension revision 1
	VK_EXT_extended_dynamic_state3              : extension revision 2
	VK_EXT_external_memory_dma_buf              : extension revision 1
	VK_EXT_external_memory_host                 : extension revision 1
	VK_EXT_global_priority                      : extension revision 2
	VK_EXT_global_priority_query                : extension revision 1
	VK_EXT_graphics_pipeline_library            : extension revision 1
	VK_EXT_host_query_reset                     : extension revision 1
	VK_EXT_image_2d_view_of_3d                  : extension revision 1
	VK_EXT_image_drm_format_modifier            : extension revision 2
	VK_EXT_image_robustness                     : extension revision 1
	VK_EXT_image_sliced_view_of_3d              : extension revision 1
	VK_EXT_image_view_min_lod                   : extension revision 1
	VK_EXT_index_type_uint8                     : extension revision 1
	VK_EXT_inline_uniform_block                 : extension revision 1
	VK_EXT_line_rasterization                   : extension revision 1
	VK_EXT_load_store_op_none                   : extension revision 1
	VK_EXT_memory_budget                        : extension revision 1
	VK_EXT_memory_priority                      : extension revision 1
	VK_EXT_multi_draw                           : extension revision 1
	VK_EXT_mutable_descriptor_type              : extension revision 1
	VK_EXT_non_seamless_cube_map                : extension revision 1
	VK_EXT_pci_bus_info                         : extension revision 2
	VK_EXT_physical_device_drm                  : extension revision 1
	VK_EXT_pipeline_creation_cache_control      : extension revision 3
	VK_EXT_pipeline_creation_feedback           : extension revision 1
	VK_EXT_post_depth_coverage                  : extension revision 1
	VK_EXT_primitive_topology_list_restart      : extension revision 1
	VK_EXT_primitives_generated_query           : extension revision 1
	VK_EXT_private_data                         : extension revision 1
	VK_EXT_provoking_vertex                     : extension revision 1
	VK_EXT_queue_family_foreign                 : extension revision 1
	VK_EXT_robustness2                          : extension revision 1
	VK_EXT_sampler_filter_minmax                : extension revision 2
	VK_EXT_scalar_block_layout                  : extension revision 1
	VK_EXT_separate_stencil_usage               : extension revision 1
	VK_EXT_shader_atomic_float                  : extension revision 1
	VK_EXT_shader_atomic_float2                 : extension revision 1
	VK_EXT_shader_demote_to_helper_invocation   : extension revision 1
	VK_EXT_shader_image_atomic_int64            : extension revision 1
	VK_EXT_shader_module_identifier             : extension revision 1
	VK_EXT_shader_stencil_export                : extension revision 1
	VK_EXT_shader_subgroup_ballot               : extension revision 1
	VK_EXT_shader_subgroup_vote                 : extension revision 1
	VK_EXT_shader_viewport_index_layer          : extension revision 1
	VK_EXT_subgroup_size_control                : extension revision 2
	VK_EXT_swapchain_maintenance1               : extension revision 1
	VK_EXT_texel_buffer_alignment               : extension revision 1
	VK_EXT_transform_feedback                   : extension revision 1
	VK_EXT_vertex_attribute_divisor             : extension revision 3
	VK_EXT_vertex_input_dynamic_state           : extension revision 2
	VK_EXT_ycbcr_image_arrays                   : extension revision 1
	VK_GOOGLE_decorate_string                   : extension revision 1
	VK_GOOGLE_hlsl_functionality1               : extension revision 1
	VK_GOOGLE_user_type                         : extension revision 1
	VK_INTEL_shader_integer_functions2          : extension revision 1
	VK_KHR_16bit_storage                        : extension revision 1
	VK_KHR_8bit_storage                         : extension revision 1
	VK_KHR_bind_memory2                         : extension revision 1
	VK_KHR_buffer_device_address                : extension revision 1
	VK_KHR_copy_commands2                       : extension revision 1
	VK_KHR_create_renderpass2                   : extension revision 1
	VK_KHR_dedicated_allocation                 : extension revision 3
	VK_KHR_deferred_host_operations             : extension revision 4
	VK_KHR_depth_stencil_resolve                : extension revision 1
	VK_KHR_descriptor_update_template           : extension revision 1
	VK_KHR_device_group                         : extension revision 4
	VK_KHR_draw_indirect_count                  : extension revision 1
	VK_KHR_driver_properties                    : extension revision 1
	VK_KHR_dynamic_rendering                    : extension revision 1
	VK_KHR_external_fence                       : extension revision 1
	VK_KHR_external_fence_fd                    : extension revision 1
	VK_KHR_external_memory                      : extension revision 1
	VK_KHR_external_memory_fd                   : extension revision 1
	VK_KHR_external_semaphore                   : extension revision 1
	VK_KHR_external_semaphore_fd                : extension revision 1
	VK_KHR_format_feature_flags2                : extension revision 2
	VK_KHR_get_memory_requirements2             : extension revision 1
	VK_KHR_global_priority                      : extension revision 1
	VK_KHR_image_format_list                    : extension revision 1
	VK_KHR_imageless_framebuffer                : extension revision 1
	VK_KHR_incremental_present                  : extension revision 2
	VK_KHR_maintenance1                         : extension revision 2
	VK_KHR_maintenance2                         : extension revision 1
	VK_KHR_maintenance3                         : extension revision 1
	VK_KHR_maintenance4                         : extension revision 2
	VK_KHR_map_memory2                          : extension revision 1
	VK_KHR_multiview                            : extension revision 1
	VK_KHR_pipeline_executable_properties       : extension revision 1
	VK_KHR_pipeline_library                     : extension revision 1
	VK_KHR_push_descriptor                      : extension revision 2
	VK_KHR_relaxed_block_layout                 : extension revision 1
	VK_KHR_sampler_mirror_clamp_to_edge         : extension revision 3
	VK_KHR_sampler_ycbcr_conversion             : extension revision 14
	VK_KHR_separate_depth_stencil_layouts       : extension revision 1
	VK_KHR_shader_atomic_int64                  : extension revision 1
	VK_KHR_shader_clock                         : extension revision 1
	VK_KHR_shader_draw_parameters               : extension revision 1
	VK_KHR_shader_float16_int8                  : extension revision 1
	VK_KHR_shader_float_controls                : extension revision 4
	VK_KHR_shader_integer_dot_product           : extension revision 1
	VK_KHR_shader_non_semantic_info             : extension revision 1
	VK_KHR_shader_subgroup_extended_types       : extension revision 1
	VK_KHR_shader_subgroup_uniform_control_flow : extension revision 1
	VK_KHR_shader_terminate_invocation          : extension revision 1
	VK_KHR_spirv_1_4                            : extension revision 1
	VK_KHR_storage_buffer_storage_class         : extension revision 1
	VK_KHR_swapchain                            : extension revision 70
	VK_KHR_swapchain_mutable_format             : extension revision 1
	VK_KHR_synchronization2                     : extension revision 1
	VK_KHR_timeline_semaphore                   : extension revision 2
	VK_KHR_uniform_buffer_standard_layout       : extension revision 1
	VK_KHR_variable_pointers                    : extension revision 1
	VK_KHR_vulkan_memory_model                  : extension revision 3
	VK_KHR_workgroup_memory_explicit_layout     : extension revision 1
	VK_KHR_zero_initialize_workgroup_memory     : extension revision 1
	VK_NV_compute_shader_derivatives            : extension revision 1
	VK_VALVE_mutable_descriptor_type            : extension revision 1

VkQueueFamilyProperties:
========================
	queueProperties[0]:
	-------------------
		minImageTransferGranularity = (1,1,1)
		queueCount                  = 1
		queueFlags                  = QUEUE_GRAPHICS_BIT | QUEUE_COMPUTE_BIT | QUEUE_TRANSFER_BIT | QUEUE_SPARSE_BINDING_BIT
		timestampValidBits          = 64
		present support             = true
		VkQueueFamilyGlobalPriorityPropertiesKHR:
		-----------------------------------------
			priorityCount  = 4
			priorities: count = 4
				QUEUE_GLOBAL_PRIORITY_LOW_KHR
				QUEUE_GLOBAL_PRIORITY_MEDIUM_KHR
				QUEUE_GLOBAL_PRIORITY_HIGH_KHR
				QUEUE_GLOBAL_PRIORITY_REALTIME_KHR


	queueProperties[1]:
	-------------------
		minImageTransferGranularity = (1,1,1)
		queueCount                  = 4
		queueFlags                  = QUEUE_COMPUTE_BIT | QUEUE_TRANSFER_BIT | QUEUE_SPARSE_BINDING_BIT
		timestampValidBits          = 64
		present support             = true
		VkQueueFamilyGlobalPriorityPropertiesKHR:
		-----------------------------------------
			priorityCount  = 4
			priorities: count = 4
				QUEUE_GLOBAL_PRIORITY_LOW_KHR
				QUEUE_GLOBAL_PRIORITY_MEDIUM_KHR
				QUEUE_GLOBAL_PRIORITY_HIGH_KHR
				QUEUE_GLOBAL_PRIORITY_REALTIME_KHR


VkPhysicalDeviceMemoryProperties:
=================================
memoryHeaps: count = 2
	memoryHeaps[0]:
		size   = 16758302720 (0x3e6df6800) (15.61 GiB)
		budget = 16649857024 (0x3e068a800) (15.51 GiB)
		usage  = 0 (0x00000000) (0.00 B)
		flags:
			None
	memoryHeaps[1]:
		size   = 4278190080 (0xff000000) (3.98 GiB)
		budget = 2656526336 (0x9e576000) (2.47 GiB)
		usage  = 0 (0x00000000) (0.00 B)
		flags: count = 1
			MEMORY_HEAP_DEVICE_LOCAL_BIT
memoryTypes: count = 11
	memoryTypes[0]:
		heapIndex     = 1
		propertyFlags = 0x0001: count = 1
			MEMORY_PROPERTY_DEVICE_LOCAL_BIT
		usable for:
			IMAGE_TILING_OPTIMAL:
				color images
				FORMAT_D16_UNORM
				FORMAT_D32_SFLOAT
				FORMAT_S8_UINT
				FORMAT_D16_UNORM_S8_UINT
				FORMAT_D32_SFLOAT_S8_UINT
			IMAGE_TILING_LINEAR:
				color images
	memoryTypes[1]:
		heapIndex     = 1
		propertyFlags = 0x0001: count = 1
			MEMORY_PROPERTY_DEVICE_LOCAL_BIT
		usable for:
			IMAGE_TILING_OPTIMAL:
				None
			IMAGE_TILING_LINEAR:
				None
	memoryTypes[2]:
		heapIndex     = 0
		propertyFlags = 0x0006: count = 2
			MEMORY_PROPERTY_HOST_VISIBLE_BIT
			MEMORY_PROPERTY_HOST_COHERENT_BIT
		usable for:
			IMAGE_TILING_OPTIMAL:
				color images
				FORMAT_D16_UNORM
				FORMAT_D32_SFLOAT
				FORMAT_S8_UINT
				FORMAT_D16_UNORM_S8_UINT
				FORMAT_D32_SFLOAT_S8_UINT
			IMAGE_TILING_LINEAR:
				color images
	memoryTypes[3]:
		heapIndex     = 1
		propertyFlags = 0x0007: count = 3
			MEMORY_PROPERTY_DEVICE_LOCAL_BIT
			MEMORY_PROPERTY_HOST_VISIBLE_BIT
			MEMORY_PROPERTY_HOST_COHERENT_BIT
		usable for:
			IMAGE_TILING_OPTIMAL:
				color images
				FORMAT_D16_UNORM
				FORMAT_D32_SFLOAT
				FORMAT_S8_UINT
				FORMAT_D16_UNORM_S8_UINT
				FORMAT_D32_SFLOAT_S8_UINT
			IMAGE_TILING_LINEAR:
				color images
	memoryTypes[4]:
		heapIndex     = 1
		propertyFlags = 0x0007: count = 3
			MEMORY_PROPERTY_DEVICE_LOCAL_BIT
			MEMORY_PROPERTY_HOST_VISIBLE_BIT
			MEMORY_PROPERTY_HOST_COHERENT_BIT
		usable for:
			IMAGE_TILING_OPTIMAL:
				None
			IMAGE_TILING_LINEAR:
				None
	memoryTypes[5]:
		heapIndex     = 0
		propertyFlags = 0x000e: count = 3
			MEMORY_PROPERTY_HOST_VISIBLE_BIT
			MEMORY_PROPERTY_HOST_COHERENT_BIT
			MEMORY_PROPERTY_HOST_CACHED_BIT
		usable for:
			IMAGE_TILING_OPTIMAL:
				color images
				FORMAT_D16_UNORM
				FORMAT_D32_SFLOAT
				FORMAT_S8_UINT
				FORMAT_D16_UNORM_S8_UINT
				FORMAT_D32_SFLOAT_S8_UINT
			IMAGE_TILING_LINEAR:
				color images
	memoryTypes[6]:
		heapIndex     = 0
		propertyFlags = 0x000e: count = 3
			MEMORY_PROPERTY_HOST_VISIBLE_BIT
			MEMORY_PROPERTY_HOST_COHERENT_BIT
			MEMORY_PROPERTY_HOST_CACHED_BIT
		usable for:
			IMAGE_TILING_OPTIMAL:
				None
			IMAGE_TILING_LINEAR:
				None
	memoryTypes[7]:
		heapIndex     = 1
		propertyFlags = 0x00c1: count = 3
			MEMORY_PROPERTY_DEVICE_LOCAL_BIT
			MEMORY_PROPERTY_DEVICE_COHERENT_BIT_AMD
			MEMORY_PROPERTY_DEVICE_UNCACHED_BIT_AMD
		usable for:
			IMAGE_TILING_OPTIMAL:
				color images
				FORMAT_D16_UNORM
				FORMAT_D32_SFLOAT
				FORMAT_S8_UINT
				FORMAT_D16_UNORM_S8_UINT
				FORMAT_D32_SFLOAT_S8_UINT
			IMAGE_TILING_LINEAR:
				color images
	memoryTypes[8]:
		heapIndex     = 0
		propertyFlags = 0x00c6: count = 4
			MEMORY_PROPERTY_HOST_VISIBLE_BIT
			MEMORY_PROPERTY_HOST_COHERENT_BIT
			MEMORY_PROPERTY_DEVICE_COHERENT_BIT_AMD
			MEMORY_PROPERTY_DEVICE_UNCACHED_BIT_AMD
		usable for:
			IMAGE_TILING_OPTIMAL:
				color images
				FORMAT_D16_UNORM
				FORMAT_D32_SFLOAT
				FORMAT_S8_UINT
				FORMAT_D16_UNORM_S8_UINT
				FORMAT_D32_SFLOAT_S8_UINT
			IMAGE_TILING_LINEAR:
				color images
	memoryTypes[9]:
		heapIndex     = 1
		propertyFlags = 0x00c7: count = 5
			MEMORY_PROPERTY_DEVICE_LOCAL_BIT
			MEMORY_PROPERTY_HOST_VISIBLE_BIT
			MEMORY_PROPERTY_HOST_COHERENT_BIT
			MEMORY_PROPERTY_DEVICE_COHERENT_BIT_AMD
			MEMORY_PROPERTY_DEVICE_UNCACHED_BIT_AMD
		usable for:
			IMAGE_TILING_OPTIMAL:
				color images
				FORMAT_D16_UNORM
				FORMAT_D32_SFLOAT
				FORMAT_S8_UINT
				FORMAT_D16_UNORM_S8_UINT
				FORMAT_D32_SFLOAT_S8_UINT
			IMAGE_TILING_LINEAR:
				color images
	memoryTypes[10]:
		heapIndex     = 0
		propertyFlags = 0x00ce: count = 5
			MEMORY_PROPERTY_HOST_VISIBLE_BIT
			MEMORY_PROPERTY_HOST_COHERENT_BIT
			MEMORY_PROPERTY_HOST_CACHED_BIT
			MEMORY_PROPERTY_DEVICE_COHERENT_BIT_AMD
			MEMORY_PROPERTY_DEVICE_UNCACHED_BIT_AMD
		usable for:
			IMAGE_TILING_OPTIMAL:
				color images
				FORMAT_D16_UNORM
				FORMAT_D32_SFLOAT
				FORMAT_S8_UINT
				FORMAT_D16_UNORM_S8_UINT
				FORMAT_D32_SFLOAT_S8_UINT
			IMAGE_TILING_LINEAR:
				color images

VkPhysicalDeviceFeatures:
=========================
	robustBufferAccess                      = true
	fullDrawIndexUint32                     = true
	imageCubeArray                          = true
	independentBlend                        = true
	geometryShader                          = true
	tessellationShader                      = true
	sampleRateShading                       = true
	dualSrcBlend                            = true
	logicOp                                 = true
	multiDrawIndirect                       = true
	drawIndirectFirstInstance               = true
	depthClamp                              = true
	depthBiasClamp                          = true
	fillModeNonSolid                        = true
	depthBounds                             = true
	wideLines                               = true
	largePoints                             = true
	alphaToOne                              = false
	multiViewport                           = true
	samplerAnisotropy                       = true
	textureCompressionETC2                  = false
	textureCompressionASTC_LDR              = false
	textureCompressionBC                    = true
	occlusionQueryPrecise                   = true
	pipelineStatisticsQuery                 = true
	vertexPipelineStoresAndAtomics          = true
	fragmentStoresAndAtomics                = true
	shaderTessellationAndGeometryPointSize  = true
	shaderImageGatherExtended               = true
	shaderStorageImageExtendedFormats       = true
	shaderStorageImageMultisample           = true
	shaderStorageImageReadWithoutFormat     = true
	shaderStorageImageWriteWithoutFormat    = true
	shaderUniformBufferArrayDynamicIndexing = true
	shaderSampledImageArrayDynamicIndexing  = true
	shaderStorageBufferArrayDynamicIndexing = true
	shaderStorageImageArrayDynamicIndexing  = true
	shaderClipDistance                      = true
	shaderCullDistance                      = true
	shaderFloat64                           = true
	shaderInt64                             = true
	shaderInt16                             = true
	shaderResourceResidency                 = true
	shaderResourceMinLod                    = true
	sparseBinding                           = true
	sparseResidencyBuffer                   = true
	sparseResidencyImage2D                  = true
	sparseResidencyImage3D                  = true
	sparseResidency2Samples                 = false
	sparseResidency4Samples                 = false
	sparseResidency8Samples                 = false
	sparseResidency16Samples                = false
	sparseResidencyAliased                  = true
	variableMultisampleRate                 = true
	inheritedQueries                        = true

VkPhysicalDevice16BitStorageFeatures:
-------------------------------------
	storageBuffer16BitAccess           = true
	uniformAndStorageBuffer16BitAccess = true
	storagePushConstant16              = true
	storageInputOutput16               = true

VkPhysicalDevice4444FormatsFeaturesEXT:
---------------------------------------
	formatA4R4G4B4 = true
	formatA4B4G4R4 = true

VkPhysicalDevice8BitStorageFeatures:
------------------------------------
	storageBuffer8BitAccess           = true
	uniformAndStorageBuffer8BitAccess = true
	storagePushConstant8              = true

VkPhysicalDeviceAttachmentFeedbackLoopLayoutFeaturesEXT:
--------------------------------------------------------
	attachmentFeedbackLoopLayout = true

VkPhysicalDeviceBorderColorSwizzleFeaturesEXT:
----------------------------------------------
	borderColorSwizzle          = true
	borderColorSwizzleFromImage = true

VkPhysicalDeviceBufferDeviceAddressFeatures:
--------------------------------------------
	bufferDeviceAddress              = true
	bufferDeviceAddressCaptureReplay = true
	bufferDeviceAddressMultiDevice   = false

VkPhysicalDeviceBufferDeviceAddressFeaturesEXT:
-----------------------------------------------
	bufferDeviceAddress              = true
	bufferDeviceAddressCaptureReplay = true
	bufferDeviceAddressMultiDevice   = false

VkPhysicalDeviceColorWriteEnableFeaturesEXT:
--------------------------------------------
	colorWriteEnable = true

VkPhysicalDeviceConditionalRenderingFeaturesEXT:
------------------------------------------------
	conditionalRendering          = true
	inheritedConditionalRendering = false

VkPhysicalDeviceCustomBorderColorFeaturesEXT:
---------------------------------------------
	customBorderColors             = true
	customBorderColorWithoutFormat = true

VkPhysicalDeviceDepthClipControlFeaturesEXT:
--------------------------------------------
	depthClipControl = true

VkPhysicalDeviceDepthClipEnableFeaturesEXT:
-------------------------------------------
	depthClipEnable = true

VkPhysicalDeviceDescriptorBufferFeaturesEXT:
--------------------------------------------
	descriptorBuffer                   = true
	descriptorBufferCaptureReplay      = false
	descriptorBufferImageLayoutIgnored = true
	descriptorBufferPushDescriptors    = true

VkPhysicalDeviceDescriptorIndexingFeatures:
-------------------------------------------
	shaderInputAttachmentArrayDynamicIndexing          = true
	shaderUniformTexelBufferArrayDynamicIndexing       = true
	shaderStorageTexelBufferArrayDynamicIndexing       = true
	shaderUniformBufferArrayNonUniformIndexing         = true
	shaderSampledImageArrayNonUniformIndexing          = true
	shaderStorageBufferArrayNonUniformIndexing         = true
	shaderStorageImageArrayNonUniformIndexing          = true
	shaderInputAttachmentArrayNonUniformIndexing       = true
	shaderUniformTexelBufferArrayNonUniformIndexing    = true
	shaderStorageTexelBufferArrayNonUniformIndexing    = true
	descriptorBindingUniformBufferUpdateAfterBind      = true
	descriptorBindingSampledImageUpdateAfterBind       = true
	descriptorBindingStorageImageUpdateAfterBind       = true
	descriptorBindingStorageBufferUpdateAfterBind      = true
	descriptorBindingUniformTexelBufferUpdateAfterBind = true
	descriptorBindingStorageTexelBufferUpdateAfterBind = true
	descriptorBindingUpdateUnusedWhilePending          = true
	descriptorBindingPartiallyBound                    = true
	descriptorBindingVariableDescriptorCount           = true
	runtimeDescriptorArray                             = true

VkPhysicalDeviceDynamicRenderingFeatures:
-----------------------------------------
	dynamicRendering = true

VkPhysicalDeviceExtendedDynamicState2FeaturesEXT:
-------------------------------------------------
	extendedDynamicState2                   = true
	extendedDynamicState2LogicOp            = true
	extendedDynamicState2PatchControlPoints = true

VkPhysicalDeviceExtendedDynamicState3FeaturesEXT:
-------------------------------------------------
	extendedDynamicState3TessellationDomainOrigin         = true
	extendedDynamicState3DepthClampEnable                 = true
	extendedDynamicState3PolygonMode                      = true
	extendedDynamicState3RasterizationSamples             = true
	extendedDynamicState3SampleMask                       = true
	extendedDynamicState3AlphaToCoverageEnable            = true
	extendedDynamicState3AlphaToOneEnable                 = false
	extendedDynamicState3LogicOpEnable                    = true
	extendedDynamicState3ColorBlendEnable                 = true
	extendedDynamicState3ColorBlendEquation               = true
	extendedDynamicState3ColorWriteMask                   = true
	extendedDynamicState3RasterizationStream              = false
	extendedDynamicState3ConservativeRasterizationMode    = true
	extendedDynamicState3ExtraPrimitiveOverestimationSize = false
	extendedDynamicState3DepthClipEnable                  = true
	extendedDynamicState3SampleLocationsEnable            = false
	extendedDynamicState3ColorBlendAdvanced               = false
	extendedDynamicState3ProvokingVertexMode              = true
	extendedDynamicState3LineRasterizationMode            = true
	extendedDynamicState3LineStippleEnable                = true
	extendedDynamicState3DepthClipNegativeOneToOne        = true
	extendedDynamicState3ViewportWScalingEnable           = false
	extendedDynamicState3ViewportSwizzle                  = false
	extendedDynamicState3CoverageToColorEnable            = false
	extendedDynamicState3CoverageToColorLocation          = false
	extendedDynamicState3CoverageModulationMode           = false
	extendedDynamicState3CoverageModulationTableEnable    = false
	extendedDynamicState3CoverageModulationTable          = false
	extendedDynamicState3CoverageReductionMode            = false
	extendedDynamicState3RepresentativeFragmentTestEnable = false
	extendedDynamicState3ShadingRateImageEnable           = false

VkPhysicalDeviceExtendedDynamicStateFeaturesEXT:
------------------------------------------------
	extendedDynamicState = true

VkPhysicalDeviceGlobalPriorityQueryFeaturesKHR:
-----------------------------------------------
	globalPriorityQuery = true

VkPhysicalDeviceGraphicsPipelineLibraryFeaturesEXT:
---------------------------------------------------
	graphicsPipelineLibrary = true

VkPhysicalDeviceHostQueryResetFeatures:
---------------------------------------
	hostQueryReset = true

VkPhysicalDeviceImage2DViewOf3DFeaturesEXT:
-------------------------------------------
	image2DViewOf3D   = true
	sampler2DViewOf3D = false

VkPhysicalDeviceImageRobustnessFeatures:
----------------------------------------
	robustImageAccess = true

VkPhysicalDeviceImageSlicedViewOf3DFeaturesEXT:
-----------------------------------------------
	imageSlicedViewOf3D = true

VkPhysicalDeviceImageViewMinLodFeaturesEXT:
-------------------------------------------
	minLod = true

VkPhysicalDeviceImagelessFramebufferFeatures:
---------------------------------------------
	imagelessFramebuffer = true

VkPhysicalDeviceIndexTypeUint8FeaturesEXT:
------------------------------------------
	indexTypeUint8 = true

VkPhysicalDeviceInlineUniformBlockFeatures:
-------------------------------------------
	inlineUniformBlock                                 = true
	descriptorBindingInlineUniformBlockUpdateAfterBind = true

VkPhysicalDeviceLineRasterizationFeaturesEXT:
---------------------------------------------
	rectangularLines         = true
	bresenhamLines           = true
	smoothLines              = false
	stippledRectangularLines = false
	stippledBresenhamLines   = true
	stippledSmoothLines      = false

VkPhysicalDeviceMaintenance4Features:
-------------------------------------
	maintenance4 = true

VkPhysicalDeviceMemoryPriorityFeaturesEXT:
------------------------------------------
	memoryPriority = true

VkPhysicalDeviceMultiDrawFeaturesEXT:
-------------------------------------
	multiDraw = true

VkPhysicalDeviceMultiviewFeatures:
----------------------------------
	multiview                   = true
	multiviewGeometryShader     = true
	multiviewTessellationShader = true

VkPhysicalDeviceMutableDescriptorTypeFeaturesEXT:
-------------------------------------------------
	mutableDescriptorType = true

VkPhysicalDeviceNonSeamlessCubeMapFeaturesEXT:
----------------------------------------------
	nonSeamlessCubeMap = true

VkPhysicalDevicePipelineCreationCacheControlFeatures:
-----------------------------------------------------
	pipelineCreationCacheControl = true

VkPhysicalDevicePipelineExecutablePropertiesFeaturesKHR:
--------------------------------------------------------
	pipelineExecutableInfo = true

VkPhysicalDevicePrimitiveTopologyListRestartFeaturesEXT:
--------------------------------------------------------
	primitiveTopologyListRestart      = true
	primitiveTopologyPatchListRestart = false

VkPhysicalDevicePrimitivesGeneratedQueryFeaturesEXT:
----------------------------------------------------
	primitivesGeneratedQuery                      = true
	primitivesGeneratedQueryWithRasterizerDiscard = true
	primitivesGeneratedQueryWithNonZeroStreams    = true

VkPhysicalDevicePrivateDataFeatures:
------------------------------------
	privateData = true

VkPhysicalDeviceProtectedMemoryFeatures:
----------------------------------------
	protectedMemory = false

VkPhysicalDeviceProvokingVertexFeaturesEXT:
-------------------------------------------
	provokingVertexLast                       = true
	transformFeedbackPreservesProvokingVertex = true

VkPhysicalDeviceRobustness2FeaturesEXT:
---------------------------------------
	robustBufferAccess2 = true
	robustImageAccess2  = true
	nullDescriptor      = true

VkPhysicalDeviceSamplerYcbcrConversionFeatures:
-----------------------------------------------
	samplerYcbcrConversion = true

VkPhysicalDeviceScalarBlockLayoutFeatures:
------------------------------------------
	scalarBlockLayout = true

VkPhysicalDeviceSeparateDepthStencilLayoutsFeatures:
----------------------------------------------------
	separateDepthStencilLayouts = true

VkPhysicalDeviceShaderAtomicFloat2FeaturesEXT:
----------------------------------------------
	shaderBufferFloat16Atomics      = false
	shaderBufferFloat16AtomicAdd    = false
	shaderBufferFloat16AtomicMinMax = false
	shaderBufferFloat32AtomicMinMax = true
	shaderBufferFloat64AtomicMinMax = true
	shaderSharedFloat16Atomics      = false
	shaderSharedFloat16AtomicAdd    = false
	shaderSharedFloat16AtomicMinMax = false
	shaderSharedFloat32AtomicMinMax = true
	shaderSharedFloat64AtomicMinMax = true
	shaderImageFloat32AtomicMinMax  = true
	sparseImageFloat32AtomicMinMax  = true

VkPhysicalDeviceShaderAtomicFloatFeaturesEXT:
---------------------------------------------
	shaderBufferFloat32Atomics   = true
	shaderBufferFloat32AtomicAdd = false
	shaderBufferFloat64Atomics   = true
	shaderBufferFloat64AtomicAdd = false
	shaderSharedFloat32Atomics   = true
	shaderSharedFloat32AtomicAdd = true
	shaderSharedFloat64Atomics   = true
	shaderSharedFloat64AtomicAdd = false
	shaderImageFloat32Atomics    = true
	shaderImageFloat32AtomicAdd  = false
	sparseImageFloat32Atomics    = true
	sparseImageFloat32AtomicAdd  = false

VkPhysicalDeviceShaderAtomicInt64Features:
------------------------------------------
	shaderBufferInt64Atomics = true
	shaderSharedInt64Atomics = true

VkPhysicalDeviceShaderClockFeaturesKHR:
---------------------------------------
	shaderSubgroupClock = true
	shaderDeviceClock   = true

VkPhysicalDeviceShaderDemoteToHelperInvocationFeatures:
-------------------------------------------------------
	shaderDemoteToHelperInvocation = true

VkPhysicalDeviceShaderDrawParametersFeatures:
---------------------------------------------
	shaderDrawParameters = true

VkPhysicalDeviceShaderFloat16Int8Features:
------------------------------------------
	shaderFloat16 = true
	shaderInt8    = true

VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT:
--------------------------------------------------
	shaderImageInt64Atomics = true
	sparseImageInt64Atomics = true

VkPhysicalDeviceShaderIntegerDotProductFeatures:
------------------------------------------------
	shaderIntegerDotProduct = true

VkPhysicalDeviceShaderModuleIdentifierFeaturesEXT:
--------------------------------------------------
	shaderModuleIdentifier = true

VkPhysicalDeviceShaderSubgroupExtendedTypesFeatures:
----------------------------------------------------
	shaderSubgroupExtendedTypes = true

VkPhysicalDeviceShaderSubgroupUniformControlFlowFeaturesKHR:
------------------------------------------------------------
	shaderSubgroupUniformControlFlow = true

VkPhysicalDeviceShaderTerminateInvocationFeatures:
--------------------------------------------------
	shaderTerminateInvocation = true

VkPhysicalDeviceSubgroupSizeControlFeatures:
--------------------------------------------
	subgroupSizeControl  = true
	computeFullSubgroups = true

VkPhysicalDeviceSwapchainMaintenance1FeaturesEXT:
-------------------------------------------------
	swapchainMaintenance1 = true

VkPhysicalDeviceSynchronization2Features:
-----------------------------------------
	synchronization2 = true

VkPhysicalDeviceTexelBufferAlignmentFeaturesEXT:
------------------------------------------------
	texelBufferAlignment = true

VkPhysicalDeviceTextureCompressionASTCHDRFeatures:
--------------------------------------------------
	textureCompressionASTC_HDR = false

VkPhysicalDeviceTimelineSemaphoreFeatures:
------------------------------------------
	timelineSemaphore = true

VkPhysicalDeviceTransformFeedbackFeaturesEXT:
---------------------------------------------
	transformFeedback = true
	geometryStreams   = true

VkPhysicalDeviceUniformBufferStandardLayoutFeatures:
----------------------------------------------------
	uniformBufferStandardLayout = true

VkPhysicalDeviceVariablePointersFeatures:
-----------------------------------------
	variablePointersStorageBuffer = true
	variablePointers              = true

VkPhysicalDeviceVertexAttributeDivisorFeaturesEXT:
--------------------------------------------------
	vertexAttributeInstanceRateDivisor     = true
	vertexAttributeInstanceRateZeroDivisor = true

VkPhysicalDeviceVertexInputDynamicStateFeaturesEXT:
---------------------------------------------------
	vertexInputDynamicState = true

VkPhysicalDeviceVulkan11Features:
---------------------------------
	storageBuffer16BitAccess           = true
	uniformAndStorageBuffer16BitAccess = true
	storagePushConstant16              = true
	storageInputOutput16               = true
	multiview                          = true
	multiviewGeometryShader            = true
	multiviewTessellationShader        = true
	variablePointersStorageBuffer      = true
	variablePointers                   = true
	protectedMemory                    = false
	samplerYcbcrConversion             = true
	shaderDrawParameters               = true

VkPhysicalDeviceVulkan12Features:
---------------------------------
	samplerMirrorClampToEdge                           = true
	drawIndirectCount                                  = true
	storageBuffer8BitAccess                            = true
	uniformAndStorageBuffer8BitAccess                  = true
	storagePushConstant8                               = true
	shaderBufferInt64Atomics                           = true
	shaderSharedInt64Atomics                           = true
	shaderFloat16                                      = true
	shaderInt8                                         = true
	descriptorIndexing                                 = true
	shaderInputAttachmentArrayDynamicIndexing          = true
	shaderUniformTexelBufferArrayDynamicIndexing       = true
	shaderStorageTexelBufferArrayDynamicIndexing       = true
	shaderUniformBufferArrayNonUniformIndexing         = true
	shaderSampledImageArrayNonUniformIndexing          = true
	shaderStorageBufferArrayNonUniformIndexing         = true
	shaderStorageImageArrayNonUniformIndexing          = true
	shaderInputAttachmentArrayNonUniformIndexing       = true
	shaderUniformTexelBufferArrayNonUniformIndexing    = true
	shaderStorageTexelBufferArrayNonUniformIndexing    = true
	descriptorBindingUniformBufferUpdateAfterBind      = true
	descriptorBindingSampledImageUpdateAfterBind       = true
	descriptorBindingStorageImageUpdateAfterBind       = true
	descriptorBindingStorageBufferUpdateAfterBind      = true
	descriptorBindingUniformTexelBufferUpdateAfterBind = true
	descriptorBindingStorageTexelBufferUpdateAfterBind = true
	descriptorBindingUpdateUnusedWhilePending          = true
	descriptorBindingPartiallyBound                    = true
	descriptorBindingVariableDescriptorCount           = true
	runtimeDescriptorArray                             = true
	samplerFilterMinmax                                = true
	scalarBlockLayout                                  = true
	imagelessFramebuffer                               = true
	uniformBufferStandardLayout                        = true
	shaderSubgroupExtendedTypes                        = true
	separateDepthStencilLayouts                        = true
	hostQueryReset                                     = true
	timelineSemaphore                                  = true
	bufferDeviceAddress                                = true
	bufferDeviceAddressCaptureReplay                   = true
	bufferDeviceAddressMultiDevice                     = false
	vulkanMemoryModel                                  = true
	vulkanMemoryModelDeviceScope                       = true
	vulkanMemoryModelAvailabilityVisibilityChains      = false
	shaderOutputViewportIndex                          = true
	shaderOutputLayer                                  = true
	subgroupBroadcastDynamicId                         = true

VkPhysicalDeviceVulkan13Features:
---------------------------------
	robustImageAccess                                  = true
	inlineUniformBlock                                 = true
	descriptorBindingInlineUniformBlockUpdateAfterBind = true
	pipelineCreationCacheControl                       = true
	privateData                                        = true
	shaderDemoteToHelperInvocation                     = true
	shaderTerminateInvocation                          = true
	subgroupSizeControl                                = true
	computeFullSubgroups                               = true
	synchronization2                                   = true
	textureCompressionASTC_HDR                         = false
	shaderZeroInitializeWorkgroupMemory                = true
	dynamicRendering                                   = true
	shaderIntegerDotProduct                            = true
	maintenance4                                       = true

VkPhysicalDeviceVulkanMemoryModelFeatures:
------------------------------------------
	vulkanMemoryModel                             = true
	vulkanMemoryModelDeviceScope                  = true
	vulkanMemoryModelAvailabilityVisibilityChains = false

VkPhysicalDeviceWorkgroupMemoryExplicitLayoutFeaturesKHR:
---------------------------------------------------------
	workgroupMemoryExplicitLayout                  = true
	workgroupMemoryExplicitLayoutScalarBlockLayout = true
	workgroupMemoryExplicitLayout8BitAccess        = true
	workgroupMemoryExplicitLayout16BitAccess       = true

VkPhysicalDeviceYcbcrImageArraysFeaturesEXT:
--------------------------------------------
	ycbcrImageArrays = true

VkPhysicalDeviceZeroInitializeWorkgroupMemoryFeatures:
------------------------------------------------------
	shaderZeroInitializeWorkgroupMemory = true
```

## Wayland

```zsh
interface: 'wl_compositor',                              version:  5, name:  1
interface: 'zwp_tablet_manager_v2',                      version:  1, name:  3
interface: 'zwp_keyboard_shortcuts_inhibit_manager_v1',  version:  1, name:  4
interface: 'xdg_wm_base',                                version:  4, name:  6
interface: 'zwlr_layer_shell_v1',                        version:  3, name:  7
interface: 'zxdg_decoration_manager_v1',                 version:  1, name:  8
interface: 'wp_viewporter',                              version:  1, name:  9
interface: 'wp_fractional_scale_manager_v1',             version:  1, name: 10
interface: 'wl_shm',                                     version:  1, name: 11
	formats (fourcc):
	0x38344258 = 'XB48'
	0x38344241 = 'AB48'
	0x30334258 = 'XB30'
	0x30334241 = 'AB30'
	0x30335258 = 'XR30'
	0x30335241 = 'AR30'
	         1 = 'XR24'
	         0 = 'AR24'
interface: 'wl_seat',                                    version:  8, name: 12
	name: 
	capabilities: pointer keyboard touch
	keyboard repeat rate: 25
	keyboard repeat delay: 660
interface: 'zwp_pointer_gestures_v1',                    version:  3, name: 13
interface: 'zwp_pointer_constraints_v1',                 version:  1, name: 14
interface: 'zwp_relative_pointer_manager_v1',            version:  1, name: 15
interface: 'wl_data_device_manager',                     version:  3, name: 16
interface: 'zwlr_data_control_manager_v1',               version:  2, name: 17
interface: 'zwp_primary_selection_device_manager_v1',    version:  1, name: 18
interface: 'org_kde_kwin_idle',                          version:  1, name: 19
interface: 'zwp_idle_inhibit_manager_v1',                version:  1, name: 20
interface: 'ext_idle_notifier_v1',                       version:  1, name: 21
interface: 'org_kde_plasma_shell',                       version:  8, name: 22
interface: 'org_kde_kwin_appmenu_manager',               version:  1, name: 23
interface: 'org_kde_kwin_server_decoration_palette_manager', version:  1, name: 24
interface: 'org_kde_plasma_virtual_desktop_management',  version:  2, name: 26
interface: 'org_kde_kwin_shadow_manager',                version:  2, name: 28
interface: 'org_kde_kwin_dpms_manager',                  version:  1, name: 29
interface: 'org_kde_kwin_server_decoration_manager',     version:  1, name: 30
interface: 'kde_output_management_v2',                   version:  3, name: 31
interface: 'zxdg_output_manager_v1',                     version:  3, name: 32
	xdg_output_v1
		output: 47
		name: 'DP-4'
		description: 'Samsung Electric Company U28E590/HNMR300016'
		logical_x: 0, logical_y: 0
		logical_width: 3840, logical_height: 2160
interface: 'wl_subcompositor',                           version:  1, name: 33
interface: 'zxdg_exporter_v2',                           version:  1, name: 34
interface: 'zxdg_importer_v2',                           version:  1, name: 35
interface: 'xdg_activation_v1',                          version:  1, name: 38
interface: 'wp_content_type_manager_v1',                 version:  1, name: 40
interface: 'wp_tearing_control_manager_v1',              version:  1, name: 41
interface: 'wl_drm',                                     version:  2, name: 43
interface: 'zwp_linux_dmabuf_v1',                        version:  4, name: 44
	main device: 0xE201 (/dev/dri/card1 or /dev/dri/renderD129)
	tranche
		target device: 0xE201 (/dev/dri/card1 or /dev/dri/renderD129)
		flags: none
		formats (fourcc) and modifiers (names):
		0x38344241 = 'AB48'; 0x020000000076bb02 = AMD_GFX10,GFX9_64K_R_X,DCC,DCC_PIPE_ALIGN,DCC_INDEPENDENT_128B,DCC_MAX_COMPRESSED_BLOCK=128B,DCC_CONSTANT_ENCODE,PIPE_XOR_BITS=3
		0x38344241 = 'AB48'; 0x0200000000601b02 = AMD_GFX10,GFX9_64K_R_X,PIPE_XOR_BITS=3
		0x38344241 = 'AB48'; 0x0200000000601902 = AMD_GFX10,GFX9_64K_S_X,PIPE_XOR_BITS=3
		0x38344241 = 'AB48'; 0x0200000000000a01 = AMD_GFX9,GFX9_64K_D
		0x38344241 = 'AB48'; 0x0200000000000901 = AMD_GFX9,GFX9_64K_S
		0x38344241 = 'AB48'; 0x0000000000000000 = LINEAR
		0x36314752 = 'RG16'; 0x020000000076bb02 = AMD_GFX10,GFX9_64K_R_X,DCC,DCC_PIPE_ALIGN,DCC_INDEPENDENT_128B,DCC_MAX_COMPRESSED_BLOCK=128B,DCC_CONSTANT_ENCODE,PIPE_XOR_BITS=3
		0x36314752 = 'RG16'; 0x0200000000601b02 = AMD_GFX10,GFX9_64K_R_X,PIPE_XOR_BITS=3
		0x36314752 = 'RG16'; 0x0200000000601902 = AMD_GFX10,GFX9_64K_S_X,PIPE_XOR_BITS=3
		0x36314752 = 'RG16'; 0x0200000000000a01 = AMD_GFX9,GFX9_64K_D
		0x36314752 = 'RG16'; 0x0200000000000901 = AMD_GFX9,GFX9_64K_S
		0x36314752 = 'RG16'; 0x0000000000000000 = LINEAR
		0x38385247 = 'GR88'; 0x020000000076bb02 = AMD_GFX10,GFX9_64K_R_X,DCC,DCC_PIPE_ALIGN,DCC_INDEPENDENT_128B,DCC_MAX_COMPRESSED_BLOCK=128B,DCC_CONSTANT_ENCODE,PIPE_XOR_BITS=3
		0x38385247 = 'GR88'; 0x0200000000601b02 = AMD_GFX10,GFX9_64K_R_X,PIPE_XOR_BITS=3
		0x38385247 = 'GR88'; 0x0200000000601902 = AMD_GFX10,GFX9_64K_S_X,PIPE_XOR_BITS=3
		0x38385247 = 'GR88'; 0x0200000000000a01 = AMD_GFX9,GFX9_64K_D
		0x38385247 = 'GR88'; 0x0200000000000901 = AMD_GFX9,GFX9_64K_S
		0x38385247 = 'GR88'; 0x0000000000000000 = LINEAR
		0x48344258 = 'XB4H'; 0x020000000076bb02 = AMD_GFX10,GFX9_64K_R_X,DCC,DCC_PIPE_ALIGN,DCC_INDEPENDENT_128B,DCC_MAX_COMPRESSED_BLOCK=128B,DCC_CONSTANT_ENCODE,PIPE_XOR_BITS=3
		0x48344258 = 'XB4H'; 0x0200000000601b02 = AMD_GFX10,GFX9_64K_R_X,PIPE_XOR_BITS=3
		0x48344258 = 'XB4H'; 0x0200000000601902 = AMD_GFX10,GFX9_64K_S_X,PIPE_XOR_BITS=3
		0x48344258 = 'XB4H'; 0x0200000000000a01 = AMD_GFX9,GFX9_64K_D
		0x48344258 = 'XB4H'; 0x0200000000000901 = AMD_GFX9,GFX9_64K_S
		0x48344258 = 'XB4H'; 0x0000000000000000 = LINEAR
		0x38344258 = 'XB48'; 0x020000000076bb02 = AMD_GFX10,GFX9_64K_R_X,DCC,DCC_PIPE_ALIGN,DCC_INDEPENDENT_128B,DCC_MAX_COMPRESSED_BLOCK=128B,DCC_CONSTANT_ENCODE,PIPE_XOR_BITS=3
		0x38344258 = 'XB48'; 0x0200000000601b02 = AMD_GFX10,GFX9_64K_R_X,PIPE_XOR_BITS=3
		0x38344258 = 'XB48'; 0x0200000000601902 = AMD_GFX10,GFX9_64K_S_X,PIPE_XOR_BITS=3
		0x38344258 = 'XB48'; 0x0200000000000a01 = AMD_GFX9,GFX9_64K_D
		0x38344258 = 'XB48'; 0x0200000000000901 = AMD_GFX9,GFX9_64K_S
		0x38344258 = 'XB48'; 0x0000000000000000 = LINEAR
		0x20203852 = 'R8  '; 0x020000000076bb02 = AMD_GFX10,GFX9_64K_R_X,DCC,DCC_PIPE_ALIGN,DCC_INDEPENDENT_128B,DCC_MAX_COMPRESSED_BLOCK=128B,DCC_CONSTANT_ENCODE,PIPE_XOR_BITS=3
		0x20203852 = 'R8  '; 0x0200000000601b02 = AMD_GFX10,GFX9_64K_R_X,PIPE_XOR_BITS=3
		0x20203852 = 'R8  '; 0x0200000000601902 = AMD_GFX10,GFX9_64K_S_X,PIPE_XOR_BITS=3
		0x20203852 = 'R8  '; 0x0200000000000a01 = AMD_GFX9,GFX9_64K_D
		0x20203852 = 'R8  '; 0x0200000000000901 = AMD_GFX9,GFX9_64K_S
		0x20203852 = 'R8  '; 0x0000000000000000 = LINEAR
		0x20363152 = 'R16 '; 0x020000000076bb02 = AMD_GFX10,GFX9_64K_R_X,DCC,DCC_PIPE_ALIGN,DCC_INDEPENDENT_128B,DCC_MAX_COMPRESSED_BLOCK=128B,DCC_CONSTANT_ENCODE,PIPE_XOR_BITS=3
		0x20363152 = 'R16 '; 0x0200000000601b02 = AMD_GFX10,GFX9_64K_R_X,PIPE_XOR_BITS=3
		0x20363152 = 'R16 '; 0x0200000000601902 = AMD_GFX10,GFX9_64K_S_X,PIPE_XOR_BITS=3
		0x20363152 = 'R16 '; 0x0200000000000a01 = AMD_GFX9,GFX9_64K_D
		0x20363152 = 'R16 '; 0x0200000000000901 = AMD_GFX9,GFX9_64K_S
		0x20363152 = 'R16 '; 0x0000000000000000 = LINEAR
		0x32335247 = 'GR32'; 0x020000000076bb02 = AMD_GFX10,GFX9_64K_R_X,DCC,DCC_PIPE_ALIGN,DCC_INDEPENDENT_128B,DCC_MAX_COMPRESSED_BLOCK=128B,DCC_CONSTANT_ENCODE,PIPE_XOR_BITS=3
		0x32335247 = 'GR32'; 0x0200000000601b02 = AMD_GFX10,GFX9_64K_R_X,PIPE_XOR_BITS=3
		0x32335247 = 'GR32'; 0x0200000000601902 = AMD_GFX10,GFX9_64K_S_X,PIPE_XOR_BITS=3
		0x32335247 = 'GR32'; 0x0200000000000901 = AMD_GFX9,GFX9_64K_S
		0x32335247 = 'GR32'; 0x0000000000000000 = LINEAR
		0x35315241 = 'AR15'; 0x020000000076bb02 = AMD_GFX10,GFX9_64K_R_X,DCC,DCC_PIPE_ALIGN,DCC_INDEPENDENT_128B,DCC_MAX_COMPRESSED_BLOCK=128B,DCC_CONSTANT_ENCODE,PIPE_XOR_BITS=3
		0x35315241 = 'AR15'; 0x0200000000601b02 = AMD_GFX10,GFX9_64K_R_X,PIPE_XOR_BITS=3
		0x35315241 = 'AR15'; 0x0200000000601902 = AMD_GFX10,GFX9_64K_S_X,PIPE_XOR_BITS=3
		0x35315241 = 'AR15'; 0x0200000000000a01 = AMD_GFX9,GFX9_64K_D
		0x35315241 = 'AR15'; 0x0200000000000901 = AMD_GFX9,GFX9_64K_S
		0x35315241 = 'AR15'; 0x0000000000000000 = LINEAR
		0x48344241 = 'AB4H'; 0x020000000076bb02 = AMD_GFX10,GFX9_64K_R_X,DCC,DCC_PIPE_ALIGN,DCC_INDEPENDENT_128B,DCC_MAX_COMPRESSED_BLOCK=128B,DCC_CONSTANT_ENCODE,PIPE_XOR_BITS=3
		0x48344241 = 'AB4H'; 0x0200000000601b02 = AMD_GFX10,GFX9_64K_R_X,PIPE_XOR_BITS=3
		0x48344241 = 'AB4H'; 0x0200000000601902 = AMD_GFX10,GFX9_64K_S_X,PIPE_XOR_BITS=3
		0x48344241 = 'AB4H'; 0x0200000000000a01 = AMD_GFX9,GFX9_64K_D
		0x48344241 = 'AB4H'; 0x0200000000000901 = AMD_GFX9,GFX9_64K_S
		0x48344241 = 'AB4H'; 0x0000000000000000 = LINEAR
	tranche
		target device: 0xE201 (/dev/dri/card1 or /dev/dri/renderD129)
		flags: none
		formats (fourcc) and modifiers (names):
		0x34325258 = 'XR24'; 0x020000000076bb02 = AMD_GFX10,GFX9_64K_R_X,DCC,DCC_PIPE_ALIGN,DCC_INDEPENDENT_128B,DCC_MAX_COMPRESSED_BLOCK=128B,DCC_CONSTANT_ENCODE,PIPE_XOR_BITS=3
		0x34325258 = 'XR24'; 0x0200000000601b02 = AMD_GFX10,GFX9_64K_R_X,PIPE_XOR_BITS=3
		0x34325258 = 'XR24'; 0x0200000000601902 = AMD_GFX10,GFX9_64K_S_X,PIPE_XOR_BITS=3
		0x34325258 = 'XR24'; 0x0200000000000901 = AMD_GFX9,GFX9_64K_S
		0x34325258 = 'XR24'; 0x0000000000000000 = LINEAR
		0x34324258 = 'XB24'; 0x020000000076bb02 = AMD_GFX10,GFX9_64K_R_X,DCC,DCC_PIPE_ALIGN,DCC_INDEPENDENT_128B,DCC_MAX_COMPRESSED_BLOCK=128B,DCC_CONSTANT_ENCODE,PIPE_XOR_BITS=3
		0x34324258 = 'XB24'; 0x0200000000601b02 = AMD_GFX10,GFX9_64K_R_X,PIPE_XOR_BITS=3
		0x34324258 = 'XB24'; 0x0200000000601902 = AMD_GFX10,GFX9_64K_S_X,PIPE_XOR_BITS=3
		0x34324258 = 'XB24'; 0x0200000000000901 = AMD_GFX9,GFX9_64K_S
		0x34324258 = 'XB24'; 0x0000000000000000 = LINEAR
		0x34325241 = 'AR24'; 0x020000000076bb02 = AMD_GFX10,GFX9_64K_R_X,DCC,DCC_PIPE_ALIGN,DCC_INDEPENDENT_128B,DCC_MAX_COMPRESSED_BLOCK=128B,DCC_CONSTANT_ENCODE,PIPE_XOR_BITS=3
		0x34325241 = 'AR24'; 0x0200000000601b02 = AMD_GFX10,GFX9_64K_R_X,PIPE_XOR_BITS=3
		0x34325241 = 'AR24'; 0x0200000000601902 = AMD_GFX10,GFX9_64K_S_X,PIPE_XOR_BITS=3
		0x34325241 = 'AR24'; 0x0200000000000901 = AMD_GFX9,GFX9_64K_S
		0x34325241 = 'AR24'; 0x0000000000000000 = LINEAR
		0x34324241 = 'AB24'; 0x020000000076bb02 = AMD_GFX10,GFX9_64K_R_X,DCC,DCC_PIPE_ALIGN,DCC_INDEPENDENT_128B,DCC_MAX_COMPRESSED_BLOCK=128B,DCC_CONSTANT_ENCODE,PIPE_XOR_BITS=3
		0x34324241 = 'AB24'; 0x0200000000601b02 = AMD_GFX10,GFX9_64K_R_X,PIPE_XOR_BITS=3
		0x34324241 = 'AB24'; 0x0200000000601902 = AMD_GFX10,GFX9_64K_S_X,PIPE_XOR_BITS=3
		0x34324241 = 'AB24'; 0x0200000000000901 = AMD_GFX9,GFX9_64K_S
		0x34324241 = 'AB24'; 0x0000000000000000 = LINEAR
	tranche
		target device: 0xE201 (/dev/dri/card1 or /dev/dri/renderD129)
		flags: none
		formats (fourcc) and modifiers (names):
		0x30334258 = 'XB30'; 0x020000000076bb02 = AMD_GFX10,GFX9_64K_R_X,DCC,DCC_PIPE_ALIGN,DCC_INDEPENDENT_128B,DCC_MAX_COMPRESSED_BLOCK=128B,DCC_CONSTANT_ENCODE,PIPE_XOR_BITS=3
		0x30334258 = 'XB30'; 0x0200000000601b02 = AMD_GFX10,GFX9_64K_R_X,PIPE_XOR_BITS=3
		0x30334258 = 'XB30'; 0x0200000000601902 = AMD_GFX10,GFX9_64K_S_X,PIPE_XOR_BITS=3
		0x30334258 = 'XB30'; 0x0200000000000901 = AMD_GFX9,GFX9_64K_S
		0x30334258 = 'XB30'; 0x0000000000000000 = LINEAR
		0x30335241 = 'AR30'; 0x020000000076bb02 = AMD_GFX10,GFX9_64K_R_X,DCC,DCC_PIPE_ALIGN,DCC_INDEPENDENT_128B,DCC_MAX_COMPRESSED_BLOCK=128B,DCC_CONSTANT_ENCODE,PIPE_XOR_BITS=3
		0x30335241 = 'AR30'; 0x0200000000601b02 = AMD_GFX10,GFX9_64K_R_X,PIPE_XOR_BITS=3
		0x30335241 = 'AR30'; 0x0200000000601902 = AMD_GFX10,GFX9_64K_S_X,PIPE_XOR_BITS=3
		0x30335241 = 'AR30'; 0x0200000000000901 = AMD_GFX9,GFX9_64K_S
		0x30335241 = 'AR30'; 0x0000000000000000 = LINEAR
		0x30334241 = 'AB30'; 0x020000000076bb02 = AMD_GFX10,GFX9_64K_R_X,DCC,DCC_PIPE_ALIGN,DCC_INDEPENDENT_128B,DCC_MAX_COMPRESSED_BLOCK=128B,DCC_CONSTANT_ENCODE,PIPE_XOR_BITS=3
		0x30334241 = 'AB30'; 0x0200000000601b02 = AMD_GFX10,GFX9_64K_R_X,PIPE_XOR_BITS=3
		0x30334241 = 'AB30'; 0x0200000000601902 = AMD_GFX10,GFX9_64K_S_X,PIPE_XOR_BITS=3
		0x30334241 = 'AB30'; 0x0200000000000901 = AMD_GFX9,GFX9_64K_S
		0x30334241 = 'AB30'; 0x0000000000000000 = LINEAR
		0x30335258 = 'XR30'; 0x020000000076bb02 = AMD_GFX10,GFX9_64K_R_X,DCC,DCC_PIPE_ALIGN,DCC_INDEPENDENT_128B,DCC_MAX_COMPRESSED_BLOCK=128B,DCC_CONSTANT_ENCODE,PIPE_XOR_BITS=3
		0x30335258 = 'XR30'; 0x0200000000601b02 = AMD_GFX10,GFX9_64K_R_X,PIPE_XOR_BITS=3
		0x30335258 = 'XR30'; 0x0200000000601902 = AMD_GFX10,GFX9_64K_S_X,PIPE_XOR_BITS=3
		0x30335258 = 'XR30'; 0x0200000000000901 = AMD_GFX9,GFX9_64K_S
		0x30335258 = 'XR30'; 0x0000000000000000 = LINEAR
interface: 'kde_output_device_v2',                       version:  2, name: 46
interface: 'wl_output',                                  version:  4, name: 47
	name: DP-4
	description: Samsung Electric Company U28E590/HNMR300016
	x: 0, y: 0, scale: 1,
	physical_width: 610 mm, physical_height: 350 mm,
	make: 'Samsung Electric Company', model: 'U28E590/HNMR300016',
	subpixel_orientation: unknown, output_transform: normal,
	mode:
		width: 3840 px, height: 2160 px, refresh: 59.997 Hz,
		flags: current
interface: 'wp_drm_lease_device_v1',                     version:  1, name: 48
	path: /dev/dri/card1
interface: 'kde_output_order_v1',                        version:  1, name: 49
interface: 'zwp_text_input_manager_v1',                  version:  1, name: 50
interface: 'zwp_text_input_manager_v2',                  version:  1, name: 51
interface: 'zwp_text_input_manager_v3',                  version:  1, name: 52
interface: 'org_kde_kwin_contrast_manager',              version:  2, name: 54
interface: 'org_kde_kwin_blur_manager',                  version:  1, name: 55
interface: 'org_kde_kwin_slide_manager',                 version:  1, name: 56
```

## Window Manager

```zsh
KWin Support Information:
The following information should be used when requesting support on e.g. https://forum.kde.org.
It provides information about the currently running instance, which options are used,
what OpenGL driver and which effects are running.
Please post the information provided underneath this introductory text to a paste bin service
like https://paste.kde.org instead of pasting into support threads.

==========================

Version
=======
KWin version: 5.27.6
Qt Version: 5.15.10
Qt compile version: 5.15.10
XCB compile version: 1.15

Operation Mode: Xwayland

Build Options
=============
KWIN_BUILD_DECORATIONS: yes
KWIN_BUILD_TABBOX: yes
KWIN_BUILD_ACTIVITIES: yes
HAVE_X11_XCB: yes
HAVE_EPOXY_GLX: yes

X11
===
Vendor: The X.Org Foundation
Vendor Release: 12301002
Protocol Version/Revision: 11/0
SHAPE: yes; Version: 0x11
RANDR: yes; Version: 0x14
DAMAGE: yes; Version: 0x11
Composite: yes; Version: 0x4
RENDER: yes; Version: 0xb
XFIXES: yes; Version: 0x50
SYNC: yes; Version: 0x31
GLX: yes; Version: 0x0

Decoration
==========
Plugin: org.kde.kwin.aurorae
Theme: __aurorae__svg__MacVentura-Dark
Plugin recommends border size: No
onAllDesktopsAvailable: false
alphaChannelSupported: true
closeOnDoubleClickOnMenu: false
decorationButtonsLeft: 0, 2
decorationButtonsRight: 6, 3, 4, 5
borderSize: 1
gridUnit: 10
font: Noto Sans,10,-1,0,50,0,0,0,0,0
smallSpacing: 2
largeSpacing: 10

Output backend
==============
Name: DRM
Active: true
Atomic Mode Setting on GPU 0: true

Cursor
======
themeName: WhiteSur-cursors
themeSize: 24

Options
=======
focusPolicy: 0
xwaylandCrashPolicy: 
xwaylandMaxCrashCount: 3
nextFocusPrefersMouse: false
clickRaise: true
autoRaise: false
autoRaiseInterval: 0
delayFocusInterval: 0
shadeHover: false
shadeHoverInterval: 250
separateScreenFocus: false
activeMouseScreen: true
placement: 
activationDesktopPolicy: 0
focusPolicyIsReasonable: true
borderSnapZone: 10
windowSnapZone: 10
centerSnapZone: 0
snapOnlyWhenOverlapping: false
rollOverDesktops: false
focusStealingPreventionLevel: 1
operationTitlebarDblClick: 5000
operationMaxButtonLeftClick: 5000
operationMaxButtonMiddleClick: 5015
operationMaxButtonRightClick: 5014
commandActiveTitlebar1: 0
commandActiveTitlebar2: 28
commandActiveTitlebar3: 2
commandInactiveTitlebar1: 4
commandInactiveTitlebar2: 28
commandInactiveTitlebar3: 2
commandWindow1: 7
commandWindow2: 8
commandWindow3: 8
commandWindowWheel: 28
commandAll1: 10
commandAll2: 3
commandAll3: 14
keyCmdAllModKey: 16777250
condensedTitle: false
electricBorderMaximize: true
electricBorderTiling: true
electricBorderCornerRatio: 0.25
borderlessMaximizedWindows: false
killPingTimeout: 5000
hideUtilityWindowsForInactive: true
compositingMode: 1
useCompositing: true
hiddenPreviews: 1
glSmoothScale: 2
glStrictBinding: false
glStrictBindingFollowsDriver: true
glPreferBufferSwap: 101
glPlatformInterface: 2
windowsBlockCompositing: true
latencyPolicy: 
renderTimeEstimator: 
allowTearing: true

Screen Edges
============
desktopSwitching: false
desktopSwitchingMovingClients: false
cursorPushBackDistance: 1x1
timeThreshold: 150
reActivateThreshold: 350
actionTopLeft: 0
actionTop: 0
actionTopRight: 0
actionRight: 0
actionBottomRight: 0
actionBottom: 0
actionBottomLeft: 0
actionLeft: 0

Screens
=======
Active screen follows mouse:  yes
Number of Screens: 1

Screen 0:
---------
Name: DP-4
Enabled: 1
Geometry: 0,0,3840x2160
Scale: 1
Refresh Rate: 59997
Adaptive Sync: always

Compositing
===========
Compositing is active
Compositing Type: OpenGL
OpenGL vendor string: AMD
OpenGL renderer string: AMD Radeon RX 5500 XT (navi14, LLVM 15.0.7, DRM 3.52, 6.3.9-arch1-1)
OpenGL version string: 4.6 (Core Profile) Mesa 23.1.3
OpenGL platform interface: EGL
OpenGL shading language version string: 4.60
Driver: Unknown
GPU class: Unknown
OpenGL version: 4.6
GLSL version: 4.60
Mesa version: 23.1.3
Linux kernel version: 6.3.9
Direct rendering: Requires strict binding: no
GLSL shaders:  yes
Texture NPOT support:  yes
Virtual Machine:  no
OpenGL 2 Shaders are used

Loaded Effects:
---------------
colorpicker
outputlocator
screenshot
screenedge
zoom
blur
contrast
kwin4_effect_sessionquit
kwin4_effect_logout
kwin4_effect_login
slidingpopups
kwin4_effect_windowaperture
slide
kwin4_effect_squash
kwin4_effect_scale
kwin4_effect_morphingpopups
kwin4_effect_maximize
kwin4_effect_fullscreen
kwin4_effect_frozenapp
kwin4_effect_fadingpopups
kwin4_effect_dialogparent
desktopgrid
highlightwindow
overview
tileseditor
windowview
wobblywindows
blendchanges
startupfeedback
kscreen
screentransform

Currently Active Effects:
-------------------------
blur
contrast

Effect Settings:
----------------
colorpicker:

outputlocator:

screenshot:

screenedge:

zoom:
zoomFactor: 1.2
mousePointer: 0
mouseTracking: 0
focusTrackingEnabled: false
textCaretTrackingEnabled: false
focusDelay: 350
moveFactor: 20
targetZoom: 1

blur:

contrast:

kwin4_effect_sessionquit:
pluginId: kwin4_effect_sessionquit
isActiveFullScreenEffect: false

kwin4_effect_logout:
pluginId: kwin4_effect_logout
isActiveFullScreenEffect: false

kwin4_effect_login:
pluginId: kwin4_effect_login
isActiveFullScreenEffect: false

slidingpopups:
slideInDuration: 150
slideOutDuration: 250

kwin4_effect_windowaperture:
pluginId: kwin4_effect_windowaperture
isActiveFullScreenEffect: false

slide:
horizontalGap: 45
verticalGap: 20
slideBackground: true

kwin4_effect_squash:
pluginId: kwin4_effect_squash
isActiveFullScreenEffect: false

kwin4_effect_scale:
pluginId: kwin4_effect_scale
isActiveFullScreenEffect: false

kwin4_effect_morphingpopups:
pluginId: kwin4_effect_morphingpopups
isActiveFullScreenEffect: false

kwin4_effect_maximize:
pluginId: kwin4_effect_maximize
isActiveFullScreenEffect: false

kwin4_effect_fullscreen:
pluginId: kwin4_effect_fullscreen
isActiveFullScreenEffect: false

kwin4_effect_frozenapp:
pluginId: kwin4_effect_frozenapp
isActiveFullScreenEffect: false

kwin4_effect_fadingpopups:
pluginId: kwin4_effect_fadingpopups
isActiveFullScreenEffect: false

kwin4_effect_dialogparent:
pluginId: kwin4_effect_dialogparent
isActiveFullScreenEffect: false

desktopgrid:
activeView: 
gridRows: 1
gridColumns: 1
animationDuration: 300
layout: 1
partialActivationFactor: 0
gestureInProgress: false
showAddRemove: true
desktopNameAlignment: 0
desktopLayoutMode: 0
customLayoutRows: 2

highlightwindow:

overview:
activeView: 
animationDuration: 300
layout: 1
ignoreMinimized: false
blurBackground: true
partialActivationFactor: 0
gestureInProgress: false
searchText: 

tileseditor:
activeView: 
animationDuration: 200

windowview:
activeView: 
animationDuration: 300
layout: 1
ignoreMinimized: false
mode: 0
partialActivationFactor: 0
gestureInProgress: false
searchText: 

wobblywindows:
stiffness: 0.15
drag: 0.8
moveFactor: 0.1
xTesselation: 20
yTesselation: 20
minVelocity: 0
maxVelocity: 1000
stopVelocity: 0.5
minAcceleration: 0
maxAcceleration: 1000
stopAcceleration: 0.5
moveWobble: true
resizeWobble: true

blendchanges:

startupfeedback:
type: 1

kscreen:

screentransform:


Loaded Plugins:
---------------
kwin5_plugin_buttonrebinds
kwin5_plugin_colord
kwin5_plugin_krunner
kwin5_plugin_nightcolor
kwin5_plugin_screencast

Available Plugins:
------------------
kwin5_plugin_buttonrebinds
kwin5_plugin_colord
kwin5_plugin_krunner
kwin5_plugin_nightcolor
kwin5_plugin_screencast
```

## X-Server

```zsh
name of display:    :1
version number:    11.0
vendor string:    The X.Org Foundation
vendor release number:    12301002
X.Org version: 23.1.2
maximum request size:  16777212 bytes
motion buffer size:  256
bitmap unit, bit order, padding:    32, LSBFirst, 32
image byte order:    LSBFirst
number of supported pixmap formats:    7
supported pixmap formats:
    depth 1, bits_per_pixel 1, scanline_pad 32
    depth 4, bits_per_pixel 8, scanline_pad 32
    depth 8, bits_per_pixel 8, scanline_pad 32
    depth 15, bits_per_pixel 16, scanline_pad 32
    depth 16, bits_per_pixel 16, scanline_pad 32
    depth 24, bits_per_pixel 32, scanline_pad 32
    depth 32, bits_per_pixel 32, scanline_pad 32
keycode range:    minimum 8, maximum 255
focus:  window 0x200001, revert to PointerRoot
number of extensions:    25
    BIG-REQUESTS
    Composite
    DAMAGE
    DOUBLE-BUFFER
    DRI3
    GLX
    Generic Event Extension
    MIT-SHM
    Present
    RANDR
    RECORD
    RENDER
    SECURITY
    SHAPE
    SYNC
    X-Resource
    XC-MISC
    XFIXES
    XFree86-VidModeExtension
    XINERAMA
    XInputExtension
    XKEYBOARD
    XTEST
    XVideo
    XWAYLAND
default screen number:    0
number of screens:    1

screen #0:
  dimensions:    3840x2160 pixels (1016x572 millimeters)
  resolution:    96x96 dots per inch
  depths (7):    24, 1, 4, 8, 15, 16, 32
  root window id:    0x3d9
  depth of root window:    24 planes
  number of colormaps:    minimum 1, maximum 1
  default colormap:    0x49
  default number of colormap cells:    256
  preallocated pixels:    black 0, white 16777215
  options:    backing-store WHEN MAPPED, save-unders NO
  largest cursor:    3840x2160
  current input event mask:    0xfa8031
    KeyPressMask             EnterWindowMask          LeaveWindowMask          
    ExposureMask             StructureNotifyMask      SubstructureNotifyMask   
    SubstructureRedirectMask FocusChangeMask          PropertyChangeMask       
    ColormapChangeMask       
  number of visuals:    272
  default visual id:  0x4a
  visual:
    visual id:    0x4a
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x4b
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2cb
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2cc
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2cd
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2ce
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2cf
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2d0
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2d1
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2d2
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2d7
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2d8
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2d9
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2da
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2db
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2dc
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2dd
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2de
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2e3
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2e4
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2e5
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2e6
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2e7
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2e8
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2e9
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2ea
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2ef
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2f0
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2f1
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2f2
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2f3
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2f4
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2f8
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2f9
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2fa
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2fb
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2fc
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2fd
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2fe
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2ff
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x300
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x301
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x302
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x303
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x304
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x305
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x306
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x307
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x308
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x309
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x30a
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x30b
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x30c
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x30d
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x30e
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x30f
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x310
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x311
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x312
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x313
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x314
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x315
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x316
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x317
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x318
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x319
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x31a
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x31b
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x31c
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x31d
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x31e
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x31f
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x320
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x321
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x322
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x323
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x324
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x325
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x326
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x327
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x328
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x329
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x32a
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x32b
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x32c
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x32d
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x32e
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x32f
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x330
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x331
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x332
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x333
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x334
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x335
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x336
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x337
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x338
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x339
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x33a
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x33b
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x33c
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x33d
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x33e
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x33f
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x340
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x341
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x342
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x343
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x344
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x345
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x346
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x347
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x348
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x349
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x34a
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x34b
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x34c
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x34d
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x34e
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x34f
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x350
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x351
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x352
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x353
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x354
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x355
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x356
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x357
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x358
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x359
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x35a
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x35b
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x35c
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x35d
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x35e
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x35f
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x360
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x361
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x362
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x363
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x364
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x365
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x366
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x367
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x368
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x369
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x36a
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x36b
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x36c
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x36d
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x36e
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x36f
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x370
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x371
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x372
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x373
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x374
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x375
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x376
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x377
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x378
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x379
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x37a
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x37b
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x37c
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x37d
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x37e
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x37f
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x380
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x381
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x382
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x383
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x384
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x385
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x386
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x387
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x388
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x389
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x38a
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x38b
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x38c
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x38d
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x38e
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x38f
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x390
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x391
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x392
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x393
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x394
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x395
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x396
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x397
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x398
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x399
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x39a
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x39b
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x39c
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x39d
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x39e
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x39f
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3a0
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3a1
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3a2
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3a3
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3a4
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3a5
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3a6
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3a7
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3a8
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3a9
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3aa
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3ab
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3ac
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3ad
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3ae
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3af
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3b0
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3b1
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3b2
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3b3
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3b4
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3b5
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3b6
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3b7
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3b8
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3b9
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3ba
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3bb
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3bc
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3bd
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3be
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3bf
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3c0
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3c1
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3c2
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3c3
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3c4
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3c5
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3c6
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3c7
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3c8
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3c9
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3ca
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3cb
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3cc
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3cd
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3ce
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3cf
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3d0
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3d1
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3d2
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3d3
    class:    TrueColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3d4
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3d5
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3d6
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x3d7
    class:    DirectColor
    depth:    24 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x7a
    class:    TrueColor
    depth:    32 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2d3
    class:    TrueColor
    depth:    32 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2d4
    class:    TrueColor
    depth:    32 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2d5
    class:    TrueColor
    depth:    32 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2d6
    class:    TrueColor
    depth:    32 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2df
    class:    TrueColor
    depth:    32 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2e0
    class:    TrueColor
    depth:    32 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2e1
    class:    TrueColor
    depth:    32 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2e2
    class:    TrueColor
    depth:    32 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2eb
    class:    TrueColor
    depth:    32 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2ec
    class:    TrueColor
    depth:    32 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2ed
    class:    TrueColor
    depth:    32 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2ee
    class:    TrueColor
    depth:    32 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2f5
    class:    TrueColor
    depth:    32 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2f6
    class:    TrueColor
    depth:    32 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
  visual:
    visual id:    0x2f7
    class:    TrueColor
    depth:    32 planes
    available colormap entries:    256 per subfield
    red, green, blue masks:    0xff0000, 0xff00, 0xff
    significant bits in color specification:    8 bits
```
