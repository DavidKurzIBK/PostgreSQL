CREATE INDEX ordering_index
	ON public.title_akas USING btree
	(ordering ASC NULLS LAST)
	TABLESPACE pg_default 