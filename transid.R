transid <- function(probe2symbol, probe_exprs, method = "median") {
    probe2symbol$ProbeID %<>% as.character()
    probe_exprs$ProbeID %<>% as.character()
    ex <- probe_exprs %>%
        dplyr::inner_join(probe2symbol, by = "ProbeID") %>% # 合并探针的信息
        dplyr::select(-ProbeID) %>% # 去掉多余信息
        dplyr::select(GeneID, everything()) %>% # 重新排列，
        dplyr::mutate(ref = apply(across(where(is.numeric)), 1, "median")) %>%
        dplyr::arrange(desc(ref)) %>% # 把表达量的平均值按从大到小排序
        dplyr::select(-ref) %>% # 反向选择去除rowMean这一列
        dplyr::distinct(GeneID, .keep_all = T)
    return(ex)
}