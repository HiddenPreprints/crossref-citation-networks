extract_citation_links <- function(crossref_data)
{
    # list of data.frames with reference information for each crossref_data
    # entry
    refs_df <- crossref_data$reference

    crossref_data %>%
        mutate(has_refs = vapply(reference, is.data.frame, TRUE)) %>%
        filter(has_refs) %>%
        select(doi, reference) %>%
        rename(from_doi = doi) %>%
        unnest(reference) %>%
        rename(to_doi = DOI) %>%
        select(from_doi, to_doi)

}




