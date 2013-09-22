package com.webloan.support.sequence.dao;

import javax.persistence.LockModeType;

import org.springframework.data.jpa.repository.Lock;
import org.springframework.data.repository.CrudRepository;

import com.webloan.common.BaseJpaRepository;
import com.webloan.model.Sequence;

/**
 * 序列号信息Dao
 *
 */
public interface SequenceRepository extends BaseJpaRepository {

	Sequence modifySequenceBySeqType(String seqType);
}
