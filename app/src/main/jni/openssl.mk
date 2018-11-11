LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

DIR := openssl-1.1.0i

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/$(DIR) \
	$(LOCAL_PATH)/$(DIR)/crypto \
	$(LOCAL_PATH)/$(DIR)/crypto/modes \
	$(LOCAL_PATH)/$(DIR)/crypto/asn1 \
	$(LOCAL_PATH)/$(DIR)/crypto/evp \
	$(LOCAL_PATH)/$(DIR)/crypto/include \
	$(LOCAL_PATH)/$(DIR)/include \
	$(LOCAL_PATH)/$(DIR)/include/openssl

LOCAL_SRC_FILES := \
	$(DIR)/crypto/aes/aes_cbc.c \
	$(DIR)/crypto/aes/aes_cfb.c \
	$(DIR)/crypto/aes/aes_core.c \
	$(DIR)/crypto/aes/aes_ecb.c \
	$(DIR)/crypto/aes/aes_ige.c \
	$(DIR)/crypto/aes/aes_misc.c \
	$(DIR)/crypto/aes/aes_ofb.c \
	$(DIR)/crypto/aes/aes_wrap.c \
	$(DIR)/crypto/asn1/a_bitstr.c \
	$(DIR)/crypto/asn1/a_d2i_fp.c \
	$(DIR)/crypto/asn1/a_digest.c \
	$(DIR)/crypto/asn1/a_dup.c \
	$(DIR)/crypto/asn1/a_gentm.c \
	$(DIR)/crypto/asn1/a_i2d_fp.c \
	$(DIR)/crypto/asn1/a_int.c \
	$(DIR)/crypto/asn1/a_mbstr.c \
	$(DIR)/crypto/asn1/ameth_lib.c \
	$(DIR)/crypto/asn1/a_object.c \
	$(DIR)/crypto/asn1/a_octet.c \
	$(DIR)/crypto/asn1/a_print.c \
	$(DIR)/crypto/asn1/a_sign.c \
	$(DIR)/crypto/asn1/asn1_err.c \
	$(DIR)/crypto/asn1/asn1_gen.c \
	$(DIR)/crypto/asn1/asn1_lib.c \
	$(DIR)/crypto/asn1/asn1_par.c \
	$(DIR)/crypto/asn1/asn_mime.c \
	$(DIR)/crypto/asn1/asn_moid.c \
	$(DIR)/crypto/asn1/asn_mstbl.c \
	$(DIR)/crypto/asn1/asn_pack.c \
	$(DIR)/crypto/asn1/a_strex.c \
	$(DIR)/crypto/asn1/a_strnid.c \
	$(DIR)/crypto/asn1/a_time.c \
	$(DIR)/crypto/asn1/a_type.c \
	$(DIR)/crypto/asn1/a_utctm.c \
	$(DIR)/crypto/asn1/a_utf8.c \
	$(DIR)/crypto/asn1/a_verify.c \
	$(DIR)/crypto/asn1/bio_asn1.c \
	$(DIR)/crypto/asn1/bio_ndef.c \
	$(DIR)/crypto/asn1/d2i_pr.c \
	$(DIR)/crypto/asn1/d2i_pu.c \
	$(DIR)/crypto/asn1/evp_asn1.c \
	$(DIR)/crypto/asn1/f_int.c \
	$(DIR)/crypto/asn1/f_string.c \
	$(DIR)/crypto/asn1/i2d_pr.c \
	$(DIR)/crypto/asn1/i2d_pu.c \
	$(DIR)/crypto/asn1/n_pkey.c \
	$(DIR)/crypto/asn1/nsseq.c \
	$(DIR)/crypto/asn1/p5_pbe.c \
	$(DIR)/crypto/asn1/p5_pbev2.c \
	$(DIR)/crypto/asn1/p5_scrypt.c \
	$(DIR)/crypto/asn1/p8_pkey.c \
	$(DIR)/crypto/asn1/tasn_dec.c \
	$(DIR)/crypto/asn1/tasn_enc.c \
	$(DIR)/crypto/asn1/tasn_fre.c \
	$(DIR)/crypto/asn1/tasn_new.c \
	$(DIR)/crypto/asn1/tasn_prn.c \
	$(DIR)/crypto/asn1/tasn_scn.c \
	$(DIR)/crypto/asn1/tasn_typ.c \
	$(DIR)/crypto/asn1/tasn_utl.c \
	$(DIR)/crypto/asn1/t_bitst.c \
	$(DIR)/crypto/asn1/t_pkey.c \
	$(DIR)/crypto/asn1/t_spki.c \
	$(DIR)/crypto/asn1/x_algor.c \
	$(DIR)/crypto/asn1/x_bignum.c \
	$(DIR)/crypto/asn1/x_info.c \
	$(DIR)/crypto/asn1/x_int64.c \
	$(DIR)/crypto/asn1/x_long.c \
	$(DIR)/crypto/asn1/x_pkey.c \
	$(DIR)/crypto/asn1/x_sig.c \
	$(DIR)/crypto/asn1/x_spki.c \
	$(DIR)/crypto/asn1/x_val.c \
	$(DIR)/crypto/async/arch/async_null.c \
	$(DIR)/crypto/async/arch/async_posix.c \
	$(DIR)/crypto/async/arch/async_win.c \
	$(DIR)/crypto/async/async_err.c \
	$(DIR)/crypto/async/async.c \
	$(DIR)/crypto/async/async_wait.c \
	$(DIR)/crypto/bio/b_addr.c \
	$(DIR)/crypto/bio/b_dump.c \
	$(DIR)/crypto/bio/bf_buff.c \
	$(DIR)/crypto/bio/bf_lbuf.c \
	$(DIR)/crypto/bio/bf_nbio.c \
	$(DIR)/crypto/bio/bf_null.c \
	$(DIR)/crypto/bio/bio_cb.c \
	$(DIR)/crypto/bio/bio_err.c \
	$(DIR)/crypto/bio/bio_lib.c \
	$(DIR)/crypto/bio/bio_meth.c \
	$(DIR)/crypto/bio/b_print.c \
	$(DIR)/crypto/bio/b_sock2.c \
	$(DIR)/crypto/bio/b_sock.c \
	$(DIR)/crypto/bio/bss_acpt.c \
	$(DIR)/crypto/bio/bss_bio.c \
	$(DIR)/crypto/bio/bss_conn.c \
	$(DIR)/crypto/bio/bss_dgram.c \
	$(DIR)/crypto/bio/bss_fd.c \
	$(DIR)/crypto/bio/bss_file.c \
	$(DIR)/crypto/bio/bss_log.c \
	$(DIR)/crypto/bio/bss_mem.c \
	$(DIR)/crypto/bio/bss_null.c \
	$(DIR)/crypto/bio/bss_sock.c \
	$(DIR)/crypto/blake2/blake2b.c \
	$(DIR)/crypto/blake2/blake2s.c \
	$(DIR)/crypto/blake2/m_blake2b.c \
	$(DIR)/crypto/blake2/m_blake2s.c \
	$(DIR)/crypto/bn/bn_add.c \
	$(DIR)/crypto/bn/bn_asm.c \
	$(DIR)/crypto/bn/bn_blind.c \
	$(DIR)/crypto/bn/bn_const.c \
	$(DIR)/crypto/bn/bn_ctx.c \
	$(DIR)/crypto/bn/bn_depr.c \
	$(DIR)/crypto/bn/bn_dh.c \
	$(DIR)/crypto/bn/bn_div.c \
	$(DIR)/crypto/bn/bn_err.c \
	$(DIR)/crypto/bn/bn_exp2.c \
	$(DIR)/crypto/bn/bn_exp.c \
	$(DIR)/crypto/bn/bn_gcd.c \
	$(DIR)/crypto/bn/bn_gf2m.c \
	$(DIR)/crypto/bn/bn_intern.c \
	$(DIR)/crypto/bn/bn_kron.c \
	$(DIR)/crypto/bn/bn_lib.c \
	$(DIR)/crypto/bn/bn_mod.c \
	$(DIR)/crypto/bn/bn_mont.c \
	$(DIR)/crypto/bn/bn_mpi.c \
	$(DIR)/crypto/bn/bn_mul.c \
	$(DIR)/crypto/bn/bn_nist.c \
	$(DIR)/crypto/bn/bn_prime.c \
	$(DIR)/crypto/bn/bn_print.c \
	$(DIR)/crypto/bn/bn_rand.c \
	$(DIR)/crypto/bn/bn_recp.c \
	$(DIR)/crypto/bn/bn_shift.c \
	$(DIR)/crypto/bn/bn_sqr.c \
	$(DIR)/crypto/bn/bn_sqrt.c \
	$(DIR)/crypto/bn/bn_srp.c \
	$(DIR)/crypto/bn/bn_word.c \
	$(DIR)/crypto/bn/bn_x931p.c \
	$(DIR)/crypto/buffer/buf_err.c \
	$(DIR)/crypto/buffer/buffer.c \
	$(DIR)/crypto/chacha/chacha_enc.c \
	$(DIR)/crypto/cmac/cmac.c \
	$(DIR)/crypto/cmac/cm_ameth.c \
	$(DIR)/crypto/cmac/cm_pmeth.c \
	$(DIR)/crypto/cms/cms_asn1.c \
	$(DIR)/crypto/cms/cms_att.c \
	$(DIR)/crypto/cms/cms_cd.c \
	$(DIR)/crypto/cms/cms_dd.c \
	$(DIR)/crypto/cms/cms_enc.c \
	$(DIR)/crypto/cms/cms_env.c \
	$(DIR)/crypto/cms/cms_err.c \
	$(DIR)/crypto/cms/cms_ess.c \
	$(DIR)/crypto/cms/cms_io.c \
	$(DIR)/crypto/cms/cms_kari.c \
	$(DIR)/crypto/cms/cms_lib.c \
	$(DIR)/crypto/cms/cms_pwri.c \
	$(DIR)/crypto/cms/cms_sd.c \
	$(DIR)/crypto/cms/cms_smime.c \
	$(DIR)/crypto/comp/comp_err.c \
	$(DIR)/crypto/comp/comp_lib.c \
	$(DIR)/crypto/comp/c_zlib.c \
	$(DIR)/crypto/conf/conf_api.c \
	$(DIR)/crypto/conf/conf_def.c \
	$(DIR)/crypto/conf/conf_err.c \
	$(DIR)/crypto/conf/conf_lib.c \
	$(DIR)/crypto/conf/conf_mall.c \
	$(DIR)/crypto/conf/conf_mod.c \
	$(DIR)/crypto/conf/conf_sap.c \
	$(DIR)/crypto/conf/conf_ssl.c \
	$(DIR)/crypto/cpt_err.c \
	$(DIR)/crypto/cryptlib.c \
	$(DIR)/crypto/ct/ct_b64.c \
	$(DIR)/crypto/ct/ct_err.c \
	$(DIR)/crypto/ct/ct_log.c \
	$(DIR)/crypto/ct/ct_oct.c \
	$(DIR)/crypto/ct/ct_policy.c \
	$(DIR)/crypto/ct/ct_prn.c \
	$(DIR)/crypto/ct/ct_sct_ctx.c \
	$(DIR)/crypto/ct/ct_sct.c \
	$(DIR)/crypto/ct/ct_vfy.c \
	$(DIR)/crypto/ct/ct_x509v3.c \
	$(DIR)/crypto/cversion.c \
	$(DIR)/crypto/des/cbc_cksm.c \
	$(DIR)/crypto/des/cbc_enc.c \
	$(DIR)/crypto/des/cfb64ede.c \
	$(DIR)/crypto/des/cfb64enc.c \
	$(DIR)/crypto/des/cfb_enc.c \
	$(DIR)/crypto/des/des_enc.c \
	$(DIR)/crypto/des/ecb3_enc.c \
	$(DIR)/crypto/des/ecb_enc.c \
	$(DIR)/crypto/des/fcrypt_b.c \
	$(DIR)/crypto/des/fcrypt.c \
	$(DIR)/crypto/des/ofb64ede.c \
	$(DIR)/crypto/des/ofb64enc.c \
	$(DIR)/crypto/des/ofb_enc.c \
	$(DIR)/crypto/des/pcbc_enc.c \
	$(DIR)/crypto/des/qud_cksm.c \
	$(DIR)/crypto/des/rand_key.c \
	$(DIR)/crypto/des/rpc_enc.c \
	$(DIR)/crypto/des/set_key.c \
	$(DIR)/crypto/des/str2key.c \
	$(DIR)/crypto/des/xcbc_enc.c \
	$(DIR)/crypto/dso/dso_dlfcn.c \
	$(DIR)/crypto/dso/dso_dl.c \
	$(DIR)/crypto/dso/dso_err.c \
	$(DIR)/crypto/dso/dso_lib.c \
	$(DIR)/crypto/dso/dso_openssl.c \
	$(DIR)/crypto/dso/dso_vms.c \
	$(DIR)/crypto/dso/dso_win32.c \
	$(DIR)/crypto/ebcdic.c \
	$(DIR)/crypto/err/err_all.c \
	$(DIR)/crypto/err/err.c \
	$(DIR)/crypto/err/err_prn.c \
	$(DIR)/crypto/evp/bio_b64.c \
	$(DIR)/crypto/evp/bio_enc.c \
	$(DIR)/crypto/evp/bio_md.c \
	$(DIR)/crypto/evp/bio_ok.c \
	$(DIR)/crypto/evp/c_allc.c \
	$(DIR)/crypto/evp/c_alld.c \
	$(DIR)/crypto/evp/cmeth_lib.c \
	$(DIR)/crypto/evp/digest.c \
	$(DIR)/crypto/evp/e_aes_cbc_hmac_sha1.c \
	$(DIR)/crypto/evp/e_aes_cbc_hmac_sha256.c \
	$(DIR)/crypto/evp/e_aes.c \
	$(DIR)/crypto/evp/e_bf.c \
	$(DIR)/crypto/evp/e_camellia.c \
	$(DIR)/crypto/evp/e_cast.c \
	$(DIR)/crypto/evp/e_chacha20_poly1305.c \
	$(DIR)/crypto/evp/e_des3.c \
	$(DIR)/crypto/evp/e_des.c \
	$(DIR)/crypto/evp/e_idea.c \
	$(DIR)/crypto/evp/encode.c \
	$(DIR)/crypto/evp/e_null.c \
	$(DIR)/crypto/evp/e_old.c \
	$(DIR)/crypto/evp/e_rc2.c \
	$(DIR)/crypto/evp/e_rc4_hmac_md5.c \
	$(DIR)/crypto/evp/e_rc4.c \
	$(DIR)/crypto/evp/e_rc5.c \
	$(DIR)/crypto/evp/e_seed.c \
	$(DIR)/crypto/evp/evp_cnf.c \
	$(DIR)/crypto/evp/evp_enc.c \
	$(DIR)/crypto/evp/evp_err.c \
	$(DIR)/crypto/evp/evp_key.c \
	$(DIR)/crypto/evp/evp_lib.c \
	$(DIR)/crypto/evp/evp_pbe.c \
	$(DIR)/crypto/evp/evp_pkey.c \
	$(DIR)/crypto/evp/e_xcbc_d.c \
	$(DIR)/crypto/evp/m_md2.c \
	$(DIR)/crypto/evp/m_md4.c \
	$(DIR)/crypto/evp/m_md5.c \
	$(DIR)/crypto/evp/m_md5_sha1.c \
	$(DIR)/crypto/evp/m_mdc2.c \
	$(DIR)/crypto/evp/m_null.c \
	$(DIR)/crypto/evp/m_ripemd.c \
	$(DIR)/crypto/evp/m_sha1.c \
	$(DIR)/crypto/evp/m_sigver.c \
	$(DIR)/crypto/evp/m_wp.c \
	$(DIR)/crypto/evp/names.c \
	$(DIR)/crypto/evp/p5_crpt2.c \
	$(DIR)/crypto/evp/p5_crpt.c \
	$(DIR)/crypto/evp/p_dec.c \
	$(DIR)/crypto/evp/p_enc.c \
	$(DIR)/crypto/evp/p_lib.c \
	$(DIR)/crypto/evp/pmeth_fn.c \
	$(DIR)/crypto/evp/pmeth_gn.c \
	$(DIR)/crypto/evp/pmeth_lib.c \
	$(DIR)/crypto/evp/p_open.c \
	$(DIR)/crypto/evp/p_seal.c \
	$(DIR)/crypto/evp/p_sign.c \
	$(DIR)/crypto/evp/p_verify.c \
	$(DIR)/crypto/evp/scrypt.c \
	$(DIR)/crypto/ex_data.c \
	$(DIR)/crypto/hmac/hmac.c \
	$(DIR)/crypto/hmac/hm_ameth.c \
	$(DIR)/crypto/hmac/hm_pmeth.c \
	$(DIR)/crypto/init.c \
	$(DIR)/crypto/kdf/hkdf.c \
	$(DIR)/crypto/kdf/kdf_err.c \
	$(DIR)/crypto/kdf/tls1_prf.c \
	$(DIR)/crypto/lhash/lhash.c \
	$(DIR)/crypto/lhash/lh_stats.c \
	$(DIR)/crypto/md5/md5_dgst.c \
	$(DIR)/crypto/md5/md5_one.c \
	$(DIR)/crypto/mem_clr.c \
	$(DIR)/crypto/mem_dbg.c \
	$(DIR)/crypto/mem.c \
	$(DIR)/crypto/mem_sec.c \
	$(DIR)/crypto/modes/cbc128.c \
	$(DIR)/crypto/modes/ccm128.c \
	$(DIR)/crypto/modes/cfb128.c \
	$(DIR)/crypto/modes/ctr128.c \
	$(DIR)/crypto/modes/cts128.c \
	$(DIR)/crypto/modes/gcm128.c \
	$(DIR)/crypto/modes/ocb128.c \
	$(DIR)/crypto/modes/ofb128.c \
	$(DIR)/crypto/modes/wrap128.c \
	$(DIR)/crypto/modes/xts128.c \
	$(DIR)/crypto/objects/obj_dat.c \
	$(DIR)/crypto/objects/obj_err.c \
	$(DIR)/crypto/objects/obj_lib.c \
	$(DIR)/crypto/objects/obj_xref.c \
	$(DIR)/crypto/objects/o_names.c \
	$(DIR)/crypto/ocsp/ocsp_asn.c \
	$(DIR)/crypto/ocsp/ocsp_cl.c \
	$(DIR)/crypto/ocsp/ocsp_err.c \
	$(DIR)/crypto/ocsp/ocsp_ext.c \
	$(DIR)/crypto/ocsp/ocsp_ht.c \
	$(DIR)/crypto/ocsp/ocsp_lib.c \
	$(DIR)/crypto/ocsp/ocsp_prn.c \
	$(DIR)/crypto/ocsp/ocsp_srv.c \
	$(DIR)/crypto/ocsp/ocsp_vfy.c \
	$(DIR)/crypto/ocsp/v3_ocsp.c \
	$(DIR)/crypto/o_dir.c \
	$(DIR)/crypto/o_fips.c \
	$(DIR)/crypto/o_fopen.c \
	$(DIR)/crypto/o_init.c \
	$(DIR)/crypto/o_str.c \
	$(DIR)/crypto/o_time.c \
	$(DIR)/crypto/pem/pem_all.c \
	$(DIR)/crypto/pem/pem_err.c \
	$(DIR)/crypto/pem/pem_info.c \
	$(DIR)/crypto/pem/pem_lib.c \
	$(DIR)/crypto/pem/pem_oth.c \
	$(DIR)/crypto/pem/pem_pk8.c \
	$(DIR)/crypto/pem/pem_pkey.c \
	$(DIR)/crypto/pem/pem_sign.c \
	$(DIR)/crypto/pem/pem_x509.c \
	$(DIR)/crypto/pem/pem_xaux.c \
	$(DIR)/crypto/pem/pvkfmt.c \
	$(DIR)/crypto/pkcs12/p12_add.c \
	$(DIR)/crypto/pkcs12/p12_asn.c \
	$(DIR)/crypto/pkcs12/p12_attr.c \
	$(DIR)/crypto/pkcs12/p12_crpt.c \
	$(DIR)/crypto/pkcs12/p12_crt.c \
	$(DIR)/crypto/pkcs12/p12_decr.c \
	$(DIR)/crypto/pkcs12/p12_init.c \
	$(DIR)/crypto/pkcs12/p12_key.c \
	$(DIR)/crypto/pkcs12/p12_kiss.c \
	$(DIR)/crypto/pkcs12/p12_mutl.c \
	$(DIR)/crypto/pkcs12/p12_npas.c \
	$(DIR)/crypto/pkcs12/p12_p8d.c \
	$(DIR)/crypto/pkcs12/p12_p8e.c \
	$(DIR)/crypto/pkcs12/p12_sbag.c \
	$(DIR)/crypto/pkcs12/p12_utl.c \
	$(DIR)/crypto/pkcs12/pk12err.c \
	$(DIR)/crypto/pkcs7/bio_pk7.c \
	$(DIR)/crypto/pkcs7/pk7_asn1.c \
	$(DIR)/crypto/pkcs7/pk7_attr.c \
	$(DIR)/crypto/pkcs7/pk7_doit.c \
	$(DIR)/crypto/pkcs7/pk7_lib.c \
	$(DIR)/crypto/pkcs7/pk7_mime.c \
	$(DIR)/crypto/pkcs7/pk7_smime.c \
	$(DIR)/crypto/pkcs7/pkcs7err.c \
	$(DIR)/crypto/poly1305/poly1305.c \
	$(DIR)/crypto/rand/md_rand.c \
	$(DIR)/crypto/rand/rand_egd.c \
	$(DIR)/crypto/rand/rand_err.c \
	$(DIR)/crypto/rand/randfile.c \
	$(DIR)/crypto/rand/rand_lib.c \
	$(DIR)/crypto/rand/rand_unix.c \
	$(DIR)/crypto/rand/rand_vms.c \
	$(DIR)/crypto/rand/rand_win.c \
	$(DIR)/crypto/ripemd/rmd_dgst.c \
	$(DIR)/crypto/ripemd/rmd_one.c \
	$(DIR)/crypto/rsa/rsa_ameth.c \
	$(DIR)/crypto/rsa/rsa_asn1.c \
	$(DIR)/crypto/rsa/rsa_chk.c \
	$(DIR)/crypto/rsa/rsa_crpt.c \
	$(DIR)/crypto/rsa/rsa_depr.c \
	$(DIR)/crypto/rsa/rsa_err.c \
	$(DIR)/crypto/rsa/rsa_gen.c \
	$(DIR)/crypto/rsa/rsa_lib.c \
	$(DIR)/crypto/rsa/rsa_meth.c \
	$(DIR)/crypto/rsa/rsa_none.c \
	$(DIR)/crypto/rsa/rsa_null.c \
	$(DIR)/crypto/rsa/rsa_oaep.c \
	$(DIR)/crypto/rsa/rsa_ossl.c \
	$(DIR)/crypto/rsa/rsa_pk1.c \
	$(DIR)/crypto/rsa/rsa_pmeth.c \
	$(DIR)/crypto/rsa/rsa_prn.c \
	$(DIR)/crypto/rsa/rsa_pss.c \
	$(DIR)/crypto/rsa/rsa_saos.c \
	$(DIR)/crypto/rsa/rsa_sign.c \
	$(DIR)/crypto/rsa/rsa_ssl.c \
	$(DIR)/crypto/rsa/rsa_x931g.c \
	$(DIR)/crypto/rsa/rsa_x931.c \
	$(DIR)/crypto/sha/sha1dgst.c \
	$(DIR)/crypto/sha/sha1_one.c \
	$(DIR)/crypto/sha/sha256.c \
	$(DIR)/crypto/sha/sha512.c \
	$(DIR)/crypto/stack/stack.c \
	$(DIR)/crypto/threads_none.c \
	$(DIR)/crypto/threads_pthread.c \
	$(DIR)/crypto/threads_win.c \
	$(DIR)/crypto/ts/ts_asn1.c \
	$(DIR)/crypto/ts/ts_conf.c \
	$(DIR)/crypto/ts/ts_err.c \
	$(DIR)/crypto/ts/ts_lib.c \
	$(DIR)/crypto/ts/ts_req_print.c \
	$(DIR)/crypto/ts/ts_req_utils.c \
	$(DIR)/crypto/ts/ts_rsp_print.c \
	$(DIR)/crypto/ts/ts_rsp_sign.c \
	$(DIR)/crypto/ts/ts_rsp_utils.c \
	$(DIR)/crypto/ts/ts_rsp_verify.c \
	$(DIR)/crypto/ts/ts_verify_ctx.c \
	$(DIR)/crypto/txt_db/txt_db.c \
	$(DIR)/crypto/uid.c \
	$(DIR)/crypto/x509/by_dir.c \
	$(DIR)/crypto/x509/by_file.c \
	$(DIR)/crypto/x509/t_crl.c \
	$(DIR)/crypto/x509/t_req.c \
	$(DIR)/crypto/x509/t_x509.c \
	$(DIR)/crypto/x509v3/pcy_cache.c \
	$(DIR)/crypto/x509v3/pcy_data.c \
	$(DIR)/crypto/x509v3/pcy_lib.c \
	$(DIR)/crypto/x509v3/pcy_map.c \
	$(DIR)/crypto/x509v3/pcy_node.c \
	$(DIR)/crypto/x509v3/pcy_tree.c \
	$(DIR)/crypto/x509v3/v3_addr.c \
	$(DIR)/crypto/x509v3/v3_akeya.c \
	$(DIR)/crypto/x509v3/v3_akey.c \
	$(DIR)/crypto/x509v3/v3_alt.c \
	$(DIR)/crypto/x509v3/v3_asid.c \
	$(DIR)/crypto/x509v3/v3_bcons.c \
	$(DIR)/crypto/x509v3/v3_bitst.c \
	$(DIR)/crypto/x509v3/v3_conf.c \
	$(DIR)/crypto/x509v3/v3_cpols.c \
	$(DIR)/crypto/x509v3/v3_crld.c \
	$(DIR)/crypto/x509v3/v3_enum.c \
	$(DIR)/crypto/x509v3/v3err.c \
	$(DIR)/crypto/x509v3/v3_extku.c \
	$(DIR)/crypto/x509v3/v3_genn.c \
	$(DIR)/crypto/x509v3/v3_ia5.c \
	$(DIR)/crypto/x509v3/v3_info.c \
	$(DIR)/crypto/x509v3/v3_int.c \
	$(DIR)/crypto/x509v3/v3_lib.c \
	$(DIR)/crypto/x509v3/v3_ncons.c \
	$(DIR)/crypto/x509v3/v3_pcia.c \
	$(DIR)/crypto/x509v3/v3_pci.c \
	$(DIR)/crypto/x509v3/v3_pcons.c \
	$(DIR)/crypto/x509v3/v3_pku.c \
	$(DIR)/crypto/x509v3/v3_pmaps.c \
	$(DIR)/crypto/x509v3/v3_prn.c \
	$(DIR)/crypto/x509v3/v3_purp.c \
	$(DIR)/crypto/x509v3/v3_skey.c \
	$(DIR)/crypto/x509v3/v3_sxnet.c \
	$(DIR)/crypto/x509v3/v3_tlsf.c \
	$(DIR)/crypto/x509v3/v3_utl.c \
	$(DIR)/crypto/x509/x509_att.c \
	$(DIR)/crypto/x509/x509_cmp.c \
	$(DIR)/crypto/x509/x509cset.c \
	$(DIR)/crypto/x509/x509_d2.c \
	$(DIR)/crypto/x509/x509_def.c \
	$(DIR)/crypto/x509/x509_err.c \
	$(DIR)/crypto/x509/x509_ext.c \
	$(DIR)/crypto/x509/x509_lu.c \
	$(DIR)/crypto/x509/x509_meth.c \
	$(DIR)/crypto/x509/x509name.c \
	$(DIR)/crypto/x509/x509_obj.c \
	$(DIR)/crypto/x509/x509_r2x.c \
	$(DIR)/crypto/x509/x509_req.c \
	$(DIR)/crypto/x509/x509rset.c \
	$(DIR)/crypto/x509/x509_set.c \
	$(DIR)/crypto/x509/x509spki.c \
	$(DIR)/crypto/x509/x509_trs.c \
	$(DIR)/crypto/x509/x509_txt.c \
	$(DIR)/crypto/x509/x509type.c \
	$(DIR)/crypto/x509/x509_v3.c \
	$(DIR)/crypto/x509/x509_vfy.c \
	$(DIR)/crypto/x509/x509_vpm.c \
	$(DIR)/crypto/x509/x_all.c \
	$(DIR)/crypto/x509/x_attrib.c \
	$(DIR)/crypto/x509/x_crl.c \
	$(DIR)/crypto/x509/x_exten.c \
	$(DIR)/crypto/x509/x_name.c \
	$(DIR)/crypto/x509/x_pubkey.c \
	$(DIR)/crypto/x509/x_req.c \
	$(DIR)/crypto/x509/x_x509a.c \
	$(DIR)/crypto/x509/x_x509.c

LOCAL_SRC_FILES += $(info $(shell (svn co -r 36601 https://github.com/openssl/openssl/branches/OpenSSL_1_1_0-stable $(LOCAL_PATH)/$(DIR))))
LOCAL_SRC_FILES += $(info $(shell (cd $(LOCAL_PATH)/$(DIR) && ./Configure android)))
LOCAL_SRC_FILES += $(info $(shell (make -C $(LOCAL_PATH)/$(DIR) crypto/include/internal/bn_conf.h)))
LOCAL_SRC_FILES += $(info $(shell (make -C $(LOCAL_PATH)/$(DIR) crypto/include/internal/dso_conf.h)))
LOCAL_SRC_FILES += $(info $(shell (make -C $(LOCAL_PATH)/$(DIR) crypto/buildinf.h)))
LOCAL_SRC_FILES += $(info $(shell (make -C $(LOCAL_PATH)/$(DIR) include/openssl/opensslconf.h)))

LOCAL_CFLAGS := \
	-DOPENSSL_NO_AFALGENG \
	-DOPENSSL_NO_ASAN \
	-DOPENSSL_NO_ASM \
	-DOPENSSL_NO_BF \
	-DOPENSSL_NO_CAMELLIA \
	-DOPENSSL_NO_CAST \
	-DOPENSSL_NO_CRYPTO_MDEBUG \
	-DOPENSSL_NO_CRYPTO_MDEBUG_BACKTRACE \
	-DOPENSSL_NO_DGRAM \
	-DOPENSSL_NO_DH \
	-DOPENSSL_NO_DSA \
	-DOPENSSL_NO_DTLS \
	-DOPENSSL_NO_DTLS1 \
	-DOPENSSL_NO_DTLS1_2 \
	-DOPENSSL_NO_EC \
	-DOPENSSL_NO_EC_NISTP_64_GCC_128 \
	-DOPENSSL_NO_ECDH \
	-DOPENSSL_NO_ECDSA \
	-DOPENSSL_NO_EGD \
	-DOPENSSL_NO_ENGINE \
	-DOPENSSL_NO_FUZZ_AFL \
	-DOPENSSL_NO_FUZZ_LIBFUZZER \
	-DOPENSSL_NO_GOST \
	-DOPENSSL_NO_HEARTBEATS \
	-DOPENSSL_NO_IDEA \
	-DOPENSSL_NO_MD2 \
	-DOPENSSL_NO_MD4 \
	-DOPENSSL_NO_MDC2 \
	-DOPENSSL_NO_MSAN \
	-DOPENSSL_NO_RC2 \
	-DOPENSSL_NO_RC4 \
	-DOPENSSL_NO_RC5 \
	-DOPENSSL_NO_RFC3779 \
	-DOPENSSL_NO_SCTP \
	-DOPENSSL_NO_SEED \
	-DOPENSSL_NO_SOCK \
	-DOPENSSL_NO_SRP \
	-DOPENSSL_NO_SRTP \
	-DOPENSSL_NO_SSL_TRACE \
	-DOPENSSL_NO_SSL3 \
	-DOPENSSL_NO_SSL3_METHOD \
	-DOPENSSL_NO_TLS1 \
	-DOPENSSL_NO_UBSAN \
	-DOPENSSL_NO_UI \
	-DOPENSSL_NO_UNIT_TEST \
	-DOPENSSL_NO_WEAK_SSL_CIPHERS \
	-DOPENSSL_NO_WHIRLPOOL

LOCAL_CFLAGS += $(local_c_flags) -DDSO_DLFCN -DHAVE_DLFCN_H -DNDEBUG -DOPENSSL_THREADS -DOPENSSL_NO_DYNAMIC_ENGINE -DOPENSSL_PIC -DOPENSSLDIR="\"sysroot/usr/ssl\"" -DOPENSSL_USE_NODELETE -DOPENSSL_NO_HW -DOPENSSL_NO_ENGINE -DZLIB

LOCAL_LDFLAGS += -Wl,-s -Wl,-znodelete
LOCAL_LDLIBS += -ldl -pthread
LOCAL_MODULE:= libcrypto_static

include $(BUILD_STATIC_LIBRARY)